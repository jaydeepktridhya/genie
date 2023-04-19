package ai.genie.app.service

import android.annotation.SuppressLint
import android.content.Intent
import android.inputmethodservice.InputMethodService
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.text.InputType
import android.text.InputType.TYPE_CLASS_DATETIME
import android.text.InputType.TYPE_CLASS_NUMBER
import android.text.InputType.TYPE_CLASS_PHONE
import android.text.InputType.TYPE_MASK_CLASS
import android.text.TextUtils
import android.util.Log
import android.view.KeyEvent
import android.view.LayoutInflater
import android.view.View
import android.view.animation.AnimationUtils
import android.view.inputmethod.EditorInfo
import android.view.inputmethod.EditorInfo.IME_ACTION_NONE
import android.view.inputmethod.EditorInfo.IME_FLAG_NO_ENTER_ACTION
import android.view.inputmethod.EditorInfo.IME_MASK_ACTION
import android.view.inputmethod.ExtractedTextRequest
import android.view.inputmethod.InputConnection
import android.widget.*
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat
import androidx.core.view.isVisible
import androidx.recyclerview.widget.GridLayoutManager
import ai.genie.app.apiCall.ApiRetrofit
import ai.genie.app.common.MyRvAdapter
import ai.genie.app.common.extension.*
import ai.genie.app.common.spinner.CustomDropDownAdapter
import ai.genie.app.ui.main.ItemMainKeyboard
import ai.genie.app.ui.main.ItemMainKeyboard.Companion.SHIFT_OFF
import ai.genie.app.ui.main.ItemMainKeyboard.Companion.SHIFT_ON_ONE_CHAR
import ai.genie.app.ui.main.ItemMainKeyboard.Companion.SHIFT_ON_PERMANENT
import ai.genie.app.ui.main.OnKeyboardActionListener
import ai.genie.app.ui.main.SuggestionView
import ai.genie.app.util.Constant.CONTINUE_WRITING
import ai.genie.app.util.Constant.EMAIL_REPLY
import ai.genie.app.util.Constant.EmailReply.getEmailReply
import ai.genie.app.util.Constant.GRAMMAR_CHECK
import ai.genie.app.util.Constant.HELP_ME_WRITE
import ai.genie.app.util.Constant.PARAPHRASE
import ai.genie.app.util.Constant.Paraphrase.getParaphrase
import ai.genie.app.util.Constant.TRANSLATE
import ai.genie.app.util.Constant.Translate.getTranslate
import ai.genie.app.R
import ai.genie.app.databinding.KeyboardImeBinding
import com.google.gson.JsonArray
import com.google.gson.JsonObject
import org.json.JSONArray
import org.json.JSONObject
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.io.IOException
import java.util.*


class KeyboardIME : InputMethodService(), OnKeyboardActionListener,
    CustomSpinner.OnSpinnerEventsListener {

    private var SHIFT_PERM_TOGGLE_SPEED = 500
    private val KEYBOARD_LETTERS = 0
    private val KEYBOARD_SYMBOLS = 1
    private val KEYBOARD_SYMBOLS_SHIFT = 2
    private val KEYBOARD_NUMBER = 3

    private var keyboard: ItemMainKeyboard? = null
    private var lastShiftPressTS = 0L
    private var keyboardMode = KEYBOARD_LETTERS
    private var inputTypeClass = InputType.TYPE_CLASS_TEXT
    private var enterKeyType = IME_ACTION_NONE
    private var switchToLetters = false
    private var currentData = ""
    var suggestionList: List<String> = listOf()
    private val mComposing = StringBuilder()
    private val mCandidateView: SuggestionView? = null
    private var mCallBack: OnKeyboardActionListener? = null
    private var binding: KeyboardImeBinding? = null
    private var myRvAdapter: MyRvAdapter? = null
    override fun onWindowShown() {
        super.onWindowShown()
        showMainKeyboard()
    }

    override fun onWindowHidden() {
        super.onWindowHidden()
    }

    override fun onInitializeInterface() {
        super.onInitializeInterface()
        keyboard = ItemMainKeyboard(this, getKeyboardLayoutXML(), enterKeyType)
    }

    private fun initCurrentInputConnection() {
        binding?.apply {
            keyboardEmoji.setInputConnection(currentInputConnection)
        }
    }

    override fun onCreateInputView(): View {
        try {
            binding = KeyboardImeBinding.inflate(LayoutInflater.from(this), null, false)
            binding?.keyboardMain?.setKeyboard(keyboard!!)
            binding?.mockMeasureHeightKeyboardMain?.setKeyboard(keyboard!!)
            binding?.keyboardMain?.mOnKeyboardActionListener = this
            binding?.keyboardEmoji?.mOnKeyboardActionListener = this
            initCurrentInputConnection()
            initView()
            binding?.keyboardHolder?.background?.applyColorFilter(this.getProperBackgroundColor())
            changeDrawableColor(binding?.ivTranslate!!)
            changeDrawableColor(binding?.ivContinueWriting!!)
            changeDrawableColor(binding?.ivEmailReplies!!)
            changeDrawableColor(binding?.ivParaphrase!!)
            changeDrawableColor(binding?.ivGrammarCheck!!)
            changeDrawableColor(binding?.ivHelpMeWrite!!)
            changeDrawableColor(binding?.ivEmailReplies!!)
            changeDrawableColor(binding?.ivSettings!!)
            changeDrawableColor(binding?.ivSend!!)
        } catch (e: Exception) {
            Log.e("TAG", "onCreateView", e);
            throw e
        }
        return binding!!.root
    }

    override fun onStartInput(attribute: EditorInfo?, restarting: Boolean) {
        super.onStartInput(attribute, restarting)
        inputTypeClass = attribute!!.inputType and TYPE_MASK_CLASS
        enterKeyType = attribute.imeOptions and (IME_MASK_ACTION or IME_FLAG_NO_ENTER_ACTION)

        // Reset our state.  We want to do this even if restarting, because
        // the underlying state of the text editor could have changed in any way.
        mComposing.setLength(0)
        updateCandidates()

        val keyboardXml = when (inputTypeClass) {
            TYPE_CLASS_NUMBER -> {
                keyboardMode = KEYBOARD_NUMBER
                R.xml.keys_number
            }

            TYPE_CLASS_DATETIME, TYPE_CLASS_PHONE -> {
                keyboardMode = KEYBOARD_SYMBOLS
                R.xml.keys_symbols
            }
            else -> {
                keyboardMode = KEYBOARD_LETTERS
                getKeyboardLayoutXML()
            }
        }
        keyboard = ItemMainKeyboard(this, keyboardXml, enterKeyType)
        binding?.keyboardMain?.setKeyboard(keyboard!!)
        binding?.mockMeasureHeightKeyboardMain?.setKeyboard(keyboard!!)
        initCurrentInputConnection()
        updateShiftKeyState()
    }

    private fun changeDrawableColor(view: ImageView) {
        view.applyColorFilter(this.getButtonBackgroundColor())
    }

    override fun onPress(primaryCode: Int) {
        if (primaryCode != 0) {
            binding?.keyboardMain?.vibrateIfNeeded()
        }

    }

    private fun hideMainKeyboard() {
        binding?.keyboardMain?.visibility = View.GONE
        binding?.mockMeasureHeightKeyboard?.visibility = View.INVISIBLE
    }

    private fun showMainKeyboard() {
        binding?.keyboardMain?.visibility = View.VISIBLE
        binding?.clMainHeader?.visibility = View.VISIBLE
        binding?.mockMeasureHeightKeyboard?.visibility = View.GONE
    }

    private fun showOnlyKeyboard() {
        binding?.keyboardMain?.visibility = View.VISIBLE
    }

    private fun EditText.showKeyboardExt() {
        setOnFocusChangeListener { _, hasFocus ->
            if (hasFocus) {
                showOnlyKeyboard()
            }
        }
        setOnClickListener {
            showOnlyKeyboard()
        }
    }

    private fun initBackToMainKeyboard() {
        binding?.apply {
            keyboardEmoji.binding?.emojiPaletteClose?.setOnClickListener {
                keyboardEmoji.visibility = View.GONE
                keyboardEmoji.binding?.emojisList?.scrollToPosition(0)
                showMainKeyboard()
            }

        }
    }

    private fun checkIfDataAvailable(): Boolean {
        return currentInputConnection.getExtractedText(
            ExtractedTextRequest(), 0
        )?.text != null && currentInputConnection.getExtractedText(
            ExtractedTextRequest(), 0
        )?.text!!.isNotEmpty()
    }

    private fun initView() {
        binding?.apply {
            ivSettings.setOnClickListener {
                val launchIntent: Intent? =
                    packageManager.getLaunchIntentForPackage("ai.genie.app")
                startActivity(launchIntent)
            }
            ivTranslate.setOnClickListener {
                spTranslate.performClick()
                /* if (spTranslate.isEnabled) {
                     ivTranslate.setColorFilter(
                         ContextCompat.getColor(
                             it.context,
                             R.color.button_grey
                         )
                     )
                 } else {
                     ivTranslate.setColorFilter(
                         ContextCompat.getColor(
                             it.context,
                             R.color.black
                         )
                     )
                 }*/
            }
            val staticTranslateAdapter = CustomDropDownAdapter(applicationContext, getTranslate())
            binding?.spTranslate?.adapter = staticTranslateAdapter
            setSpinnerHeight(binding?.spTranslate!!)
            binding?.spTranslate?.isSelected = false
            binding?.spTranslate?.setSelection(0, true)
            binding?.spTranslate?.onItemSelectedListener =
                object : AdapterView.OnItemSelectedListener {
                    override fun onItemSelected(
                        parent: AdapterView<*>, view: View, position: Int, id: Long
                    ) {
                        if (checkIfDataAvailable()
                        ) {
                            translateAPI(
                                currentInputConnection.getExtractedText(
                                    ExtractedTextRequest(), 0
                                )?.text.toString(), getTranslate()[position]
                            )
                        }
                    }

                    override fun onNothingSelected(parent: AdapterView<*>) {
                    }
                }
            binding?.ivGrammarCheck?.setOnClickListener {
                if (checkIfDataAvailable()) {
                    grammarCheckAPI(
                        currentInputConnection.getExtractedText(
                            ExtractedTextRequest(), 0
                        )?.text.toString()
                    )
                }
            }
            ivParaphrase.setOnClickListener {
                spParaphrase.performClick()
            }
            val staticParaphraseAdapter = CustomDropDownAdapter(applicationContext, getParaphrase())
            binding?.spParaphrase?.adapter = staticParaphraseAdapter
            setSpinnerHeight(binding?.spParaphrase!!)
            binding?.spParaphrase?.isSelected = false
            binding?.spParaphrase?.setSelection(0, true)
            binding?.spParaphrase?.onItemSelectedListener =
                object : AdapterView.OnItemSelectedListener {
                    override fun onItemSelected(
                        parent: AdapterView<*>, view: View, position: Int, id: Long
                    ) {
                        if (checkIfDataAvailable()
                        ) {
                            paraphraseAPI(
                                currentInputConnection.getExtractedText(
                                    ExtractedTextRequest(), 0
                                )?.text.toString(), getParaphrase()[position]
                            )
                        }
                    }

                    override fun onNothingSelected(parent: AdapterView<*>) {

                    }
                }
            etWrite.showKeyboardExt()
            ivContinueWriting.setOnClickListener {
                if (clSubHeader.visibility == View.INVISIBLE) {
                    clSuggestions.visibility = View.GONE
                    clSubHeader.visibility = View.VISIBLE
                    val rightSwipe = AnimationUtils.loadAnimation(it.context, R.anim.anim_right)
                    clSubHeader.startAnimation(rightSwipe)
                } else {
                    etWrite.setText("")
                    val rightSwipe = AnimationUtils.loadAnimation(it.context, R.anim.anim_left)
                    clSubHeader.startAnimation(rightSwipe)
                    clSubHeader.visibility = View.INVISIBLE
                    Handler(Looper.getMainLooper()).postDelayed({
                        clSuggestions.visibility = View.VISIBLE
                    }, 500)
                }
            }
            ivSend.setOnClickListener {
                Log.e("TAG", "initView:Send clicked ")
                if (etWrite.text.trim().toString().isNotEmpty()) {
                    continueWritingAPI(
                        etWrite.text.trim().toString()
                    )
                    val rightSwipe = AnimationUtils.loadAnimation(it.context, R.anim.anim_left)
                    clSubHeader.startAnimation(rightSwipe)
                    clSubHeader.visibility = View.INVISIBLE
                    etWrite.setText("")
                }
            }
            ivEmailReplies.setOnClickListener {
                spEmailReply.performClick()
            }
            val staticEmailReplyAdapter = CustomDropDownAdapter(applicationContext, getEmailReply())
            binding?.spEmailReply?.adapter = staticEmailReplyAdapter
            setSpinnerHeight(binding?.spEmailReply!!)
            binding?.spEmailReply?.isSelected = false
            binding?.spEmailReply?.setSelection(0, true)
            binding?.spEmailReply?.onItemSelectedListener =
                object : AdapterView.OnItemSelectedListener {
                    override fun onItemSelected(
                        parent: AdapterView<*>, view: View, position: Int, id: Long
                    ) {
                        if (checkIfDataAvailable()
                        ) {
                            if (currentInputConnection.getExtractedText(
                                    ExtractedTextRequest(), 0
                                )?.text?.length!! > 6
                            )
                                emailReplyAPI(
                                    currentInputConnection.getExtractedText(
                                        ExtractedTextRequest(), 0
                                    )?.text.toString(), getEmailReply()[position]
                                )
                        } else {
                            Log.e("TAG", "onItemSelected: Data is small ")
                        }

                    }

                    override fun onNothingSelected(parent: AdapterView<*>) {

                    }
                }
            ivHelpMeWrite.setOnClickListener {
                if (checkIfDataAvailable()) {
                    helpMeWritingAPI(
                        currentInputConnection.getExtractedText(
                            ExtractedTextRequest(), 0
                        )?.text.toString()
                    )
                }
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                binding?.keyboardEmoji?.setupEmojiPalette(
                    toolbarColor = ContextCompat.getColor(
                        binding?.keyboardEmoji?.context!!, R.color.you_keyboard_toolbar_color
                    ),
                    backgroundColor = binding?.keyboardEmoji?.context!!.getProperBackgroundColor(),
                    textColor = binding?.keyboardEmoji?.context!!.getProperTextColor()
                )
            }
        }

        initBackToMainKeyboard()

    }

    private fun setSpinnerHeight(spinnerView: Spinner) {
        try {
            val popup = Spinner::class.java.getDeclaredField("mPopup")
            popup.isAccessible = true
            val popupWindow = popup.get(spinnerView) as ListPopupWindow
            popupWindow.height = 600
        } catch (_: NoClassDefFoundError) {

        }
    }

    private fun updateShiftKeyState() {
        if (keyboardMode == KEYBOARD_LETTERS) {
            val editorInfo = currentInputEditorInfo
            if (editorInfo != null && editorInfo.inputType != InputType.TYPE_NULL &&
                keyboard?.mShiftState != SHIFT_ON_PERMANENT
            ) {
                if (currentInputConnection.getCursorCapsMode(editorInfo.inputType) != 0) {
                    keyboard?.setShifted(SHIFT_ON_ONE_CHAR)
                    binding?.keyboardMain?.invalidateAllKeys()
                }
            }
        }
    }

    @SuppressLint("NotifyDataSetChanged")
    @RequiresApi(Build.VERSION_CODES.M)
    override fun onKey(code: Int) {
        var inputConnection = currentInputConnection
        if (binding?.etWrite?.visibility == View.VISIBLE) {
            val et1 = binding?.etWrite
            val et1Connection = et1?.onCreateInputConnection(EditorInfo())
            if (et1?.isFocused == true) {
                inputConnection = et1Connection
            }
        } else {
            inputConnection = currentInputConnection
        }
        onKeyExt(code, inputConnection)
    }

    override fun onActionUp() {
        if (switchToLetters) {
            keyboardMode = KEYBOARD_LETTERS
            keyboard = ItemMainKeyboard(this, getKeyboardLayoutXML(), enterKeyType)

            val editorInfo = currentInputEditorInfo
            if (editorInfo != null && editorInfo.inputType != InputType.TYPE_NULL && keyboard?.mShiftState != SHIFT_ON_PERMANENT) {
                if (currentInputConnection.getCursorCapsMode(editorInfo.inputType) != 0) {
                    keyboard?.setShifted(SHIFT_ON_ONE_CHAR)
                }
            }

            binding?.keyboardMain?.setKeyboard(keyboard!!)
            switchToLetters = false
        }
    }

    override fun moveCursorLeft() {
        moveCursor(false)
    }

    override fun moveCursorRight() {
        moveCursor(true)
        pickDefaultCandidate()
    }

    override fun onText(text: String) {
        currentInputConnection?.commitText(text, 0)
    }

    private fun deleteCurrentText(ic: InputConnection) {
        if (ic.getSelectedText(0).isNullOrBlank()) {
            // no selection, so delete previous data
            ic.deleteSurroundingText(
                ic.getExtractedText(
                    ExtractedTextRequest(), 0
                )?.text.toString().length, ic.getExtractedText(
                    ExtractedTextRequest(), 0
                )?.text.toString().length
            )
        }
        ic.commitText("", 1)
    }


    fun pickDefaultCandidate() {
        pickSuggestionManually()
    }

    fun pickSuggestionManually() {
        // If we were generating candidate suggestions for the current
        // text, we would commit one of them here.  But for this sample,
        // we will just commit the current text.
        commitTyped(currentInputConnection)
    }

    /**
     * Helper function to commit any text being composed in to the editor.
     */
    private fun commitTyped(inputConnection: InputConnection) {
        if (mComposing.isNotEmpty()) {
            inputConnection.commitText(mComposing, mComposing.length)
            mComposing.setLength(0)
            updateCandidates()
        }
    }

    /**
     * Update the list of available candidates from the current composing
     * text.  This will need to be filled in by however you are determining
     * candidates.
     */
    private fun updateCandidates() {

        if (mComposing.isNotEmpty()) {
            val list = ArrayList<String>()
            list.add(mComposing.toString())
            setSuggestions(list, true, true)
        } else {
            setSuggestions(null, false, false)
        }

    }

    private fun setSuggestions(
        suggestions: List<String>?, completions: Boolean,
        typedWordValid: Boolean
    ) {
        if (suggestions != null && suggestions.isNotEmpty()) {
            setCandidatesViewShown(true)
        } else if (isExtractViewShown) {
            setCandidatesViewShown(true)
        }
        mCandidateView?.setSuggestions(suggestions, completions, typedWordValid)
    }

    override fun onCreateCandidatesView(): View? {
        return super.onCreateCandidatesView()
    }

    @SuppressLint("NotifyDataSetChanged")
    @RequiresApi(Build.VERSION_CODES.M)
    private fun onKeyExt(code: Int, inputConnection: InputConnection) {
        if (keyboard == null) {
            return
        }

        if (code != ItemMainKeyboard.KEYCODE_SHIFT) {
            lastShiftPressTS = 0
        }

        when (code) {
            ItemMainKeyboard.KEYCODE_DELETE -> {
                if (keyboard!!.mShiftState == SHIFT_ON_ONE_CHAR) {
                    keyboard!!.mShiftState = SHIFT_OFF
                }
                val length = mComposing.length
                if (length > 1) {
                    mComposing.delete(length - 1, length)
                    currentInputConnection.setComposingText(mComposing, 1)
                    updateCandidates()
                } else if (length > 0) {
                    mComposing.setLength(0)
                    currentInputConnection.commitText("", 0)
                    updateCandidates()
                }
                val selectedText = inputConnection.getSelectedText(0)
                if (TextUtils.isEmpty(selectedText)) {
                    inputConnection.sendKeyEvent(
                        KeyEvent(
                            KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DEL
                        )
                    )
                    inputConnection.sendKeyEvent(KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_DEL))
                } else {
                    inputConnection.commitText("", 1)
                }

                if (inputConnection != currentInputConnection) {
                    inputConnection.deleteSurroundingText(1, 0)
                }

                binding?.keyboardMain?.invalidateAllKeys()
            }
            ItemMainKeyboard.KEYCODE_SHIFT -> {
                if (keyboardMode == KEYBOARD_LETTERS) {
                    when {
                        keyboard!!.mShiftState == SHIFT_ON_PERMANENT -> keyboard!!.mShiftState =
                            SHIFT_OFF
                        System.currentTimeMillis() - lastShiftPressTS < SHIFT_PERM_TOGGLE_SPEED -> keyboard!!.mShiftState =
                            SHIFT_ON_PERMANENT
                        keyboard!!.mShiftState == SHIFT_ON_ONE_CHAR -> keyboard!!.mShiftState =
                            SHIFT_OFF
                        keyboard!!.mShiftState == SHIFT_OFF -> keyboard!!.mShiftState =
                            SHIFT_ON_ONE_CHAR
                    }

                    lastShiftPressTS = System.currentTimeMillis()
                } else {
                    val keyboardXml = if (keyboardMode == KEYBOARD_SYMBOLS) {
                        keyboardMode = KEYBOARD_SYMBOLS_SHIFT
                        R.xml.keys_symbols_shift
                    } else {
                        keyboardMode = KEYBOARD_SYMBOLS
                        R.xml.keys_symbols
                    }
                    keyboard = ItemMainKeyboard(this, keyboardXml, enterKeyType)
                    binding?.keyboardMain?.setKeyboard(keyboard!!)
                }
                binding?.keyboardMain?.invalidateAllKeys()
            }
            ItemMainKeyboard.KEYCODE_ENTER -> {
                val imeOptionsActionId = getImeOptionsActionId()
                if (imeOptionsActionId != IME_ACTION_NONE) {
                    inputConnection.performEditorAction(imeOptionsActionId)
                } else {
                    inputConnection.sendKeyEvent(
                        KeyEvent(
                            KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_ENTER
                        )
                    )
                    inputConnection.sendKeyEvent(
                        KeyEvent(
                            KeyEvent.ACTION_UP, KeyEvent.KEYCODE_ENTER
                        )
                    )
                }

                if (inputConnection != currentInputConnection) {
                    inputConnection.commitText("\n", 1)
                }

            }
            ItemMainKeyboard.KEYCODE_MODE_CHANGE -> {
                val keyboardXml = if (keyboardMode == KEYBOARD_LETTERS) {
                    keyboardMode = KEYBOARD_SYMBOLS
                    R.xml.keys_symbols
                } else {
                    keyboardMode = KEYBOARD_LETTERS
                    getKeyboardLayoutXML()
                }
                keyboard = ItemMainKeyboard(this, keyboardXml, enterKeyType)
                binding?.keyboardMain?.setKeyboard(keyboard!!)
            }
            ItemMainKeyboard.KEYCODE_EMOJI -> {
                binding?.clMainHeader?.visibility = View.GONE
                hideMainKeyboard()
                binding?.keyboardEmoji?.visibility = View.VISIBLE
                binding?.keyboardEmoji?.openEmojiPalette()
            }
            else -> {
                var codeChar = code.toChar()
                if (Character.isLetter(codeChar) && keyboard!!.mShiftState > SHIFT_OFF) {
                    codeChar = Character.toUpperCase(codeChar)
                }

                // If the keyboard is set to symbols and the user presses space, we usually should switch back to the letters keyboard.
                // However, avoid doing that in cases when the EditText for example requires numbers as the input.
                // We can detect that by the text not changing on pressing Space.
                if (keyboardMode != KEYBOARD_LETTERS && code == ItemMainKeyboard.KEYCODE_SPACE) {
                    val originalText =
                        inputConnection.getExtractedText(ExtractedTextRequest(), 0)?.text ?: return
                    inputConnection.commitText(codeChar.toString(), 1)
                    val newText = inputConnection.getExtractedText(ExtractedTextRequest(), 0).text
                    switchToLetters = originalText != newText
                } else {
                    inputConnection.commitText(codeChar.toString(), 1)
                }

                if (keyboard!!.mShiftState == SHIFT_ON_ONE_CHAR && keyboardMode == KEYBOARD_LETTERS) {
                    keyboard!!.mShiftState = SHIFT_OFF
                    binding?.keyboardMain?.invalidateAllKeys()
                }
            }
        }

        if (code != ItemMainKeyboard.KEYCODE_SHIFT) {
            updateShiftKeyState()
        }
        val fullData = inputConnection.getExtractedText(
            ExtractedTextRequest(), 0
        ).text.toString()
        val fullDataList = fullData.split(" ")
        fun getData(data: String) {
            val gridLayoutManager = GridLayoutManager(applicationContext, 3)
            myRvAdapter = MyRvAdapter(
                getSuggestions(
                    data
                ),
                applicationContext,
            )
            binding?.rvSuggestions?.layoutManager = gridLayoutManager
            binding?.rvSuggestions?.adapter = myRvAdapter
            binding?.rvSuggestions?.post { myRvAdapter?.notifyDataSetChanged() }

        }
        if (code != ItemMainKeyboard.KEYCODE_SPACE && code != ItemMainKeyboard.KEYCODE_EMOJI &&
            code != ItemMainKeyboard.KEYCODE_ENTER && code != ItemMainKeyboard.KEYCODE_SHIFT
            && code != ItemMainKeyboard.KEYCODE_MODE_CHANGE
        ) {
            if (inputConnection.getTextBeforeCursor(
                    fullDataList.last().length,
                    0
                ).toString().isNotBlank()
            ) {
                val beforeData = inputConnection.getTextBeforeCursor(
                    fullDataList.last().length,
                    0
                ).toString()
                getData(
                    beforeData
                )
                binding?.rvSuggestions?.addOnItemClickListener(object : OnItemClickListener {
                    override fun onItemClicked(position: Int, view: View) {
                        Log.e("TAG", "onSuggestionItemClicked: $currentData")
                        inputConnection.deleteSurroundingText(
                            currentData.length, 0
                        )
                        myRvAdapter?.removeItems()
                        inputConnection.commitText(suggestionList[position], 1)
                    }
                })
            }
        } else if (code == ItemMainKeyboard.KEYCODE_SPACE) {
            myRvAdapter?.removeItems()
        }

    }

    private fun moveCursor(moveRight: Boolean) {
        val extractedText =
            currentInputConnection?.getExtractedText(ExtractedTextRequest(), 0) ?: return
        var newCursorPosition = extractedText.selectionStart
        newCursorPosition = if (moveRight) {
            newCursorPosition + 1
        } else {
            newCursorPosition - 1
        }

        currentInputConnection?.setSelection(newCursorPosition, newCursorPosition)
    }

    private fun getImeOptionsActionId(): Int {
        return if (currentInputEditorInfo.imeOptions and IME_FLAG_NO_ENTER_ACTION != 0) {
            IME_ACTION_NONE
        } else {
            currentInputEditorInfo.imeOptions and IME_MASK_ACTION
        }
    }

    private fun getKeyboardLayoutXML(): Int {
        return R.xml.keys_letters_qwerty
    }

    private fun translateAPI(data: String, translate: String) {
        showProgress(TRANSLATE)
        generateResponse("Translate $data to $translate")
        Log.e("===========", "AI Will respond on: Translate $data to $translate")
    }

    private fun grammarCheckAPI(grammarCheckData: String) {
        showProgress(GRAMMAR_CHECK)
        generateResponse("Correct this to standard English: $grammarCheckData")
        Log.e(
            "===========",
            "AI Will respond on: Correct this to standard English: $grammarCheckData"
        )
    }

    private fun paraphraseAPI(data: String, type: String) {
        showProgress(PARAPHRASE)
        generateResponse("Paraphrase: $data in $type tone")
        Log.e("===========", "AI Will respond on: Paraphrase: $data in $type tone")
    }

    private fun continueWritingAPI(data: String) {
        showProgress(CONTINUE_WRITING)
        generateResponse("Continue Writing on: $data")
        Log.e("===========", "AI Will respond on: Continue Writing on: $data")
    }

    private fun emailReplyAPI(data: String, type: String) {
        showProgress(EMAIL_REPLY)
        generateResponse("Write an email for:$data in $type tone")
        Log.e("===========", "AI Will respond on: Write an email for:$data in $type tone")
    }

    private fun helpMeWritingAPI(data: String) {
        showProgress(HELP_ME_WRITE)
        generateResponse("Help me write with: $data")
        Log.e("===========", "AI Will respond on: Help me write with: $data")
    }

    private fun getSuggestions(data: String): List<String> {
        if (data.isNotEmpty()) {
            currentData = data
            generateSuggestionResponse(data)
            Log.e("===========", "Suggestions for :$data")
        } else {
            Log.e("===========", "No data for suggestion")
        }
        return suggestionList
    }

    private fun generateResponse(prompt: String) {
        val jsonObject = JsonObject()
        jsonObject.addProperty("model", "text-davinci-003")
        jsonObject.addProperty("prompt", prompt)
        jsonObject.addProperty("temperature", 0.2)
        jsonObject.addProperty("max_tokens", 2000)
        jsonObject.addProperty("frequency_penalty", 1)
        jsonObject.addProperty("presence_penalty", 1)

        val call: Call<JsonObject> = ApiRetrofit.getClient().request(jsonObject)
        call.enqueue(object : Callback<JsonObject> {
            override fun onResponse(call: Call<JsonObject>, response: Response<JsonObject>) {
                hideProgress()
                if (response.isSuccessful) {
                    try {
                        val responseString = response.body()
                        Log.e("Response: ", responseString.toString())
                        Log.e("Created: ", response.body()!!.get("created").toString())
                        val choices = response.body()!!.get("choices") as JsonArray
                        var text = choices.get(0).asJsonObject.get("text").toString()
                            .replace("\"\\n\\n", "")
                        if (text.startsWith("\"\\n\\n")) {
                            text = replace("\"\\n\\n", 0, ' ')
                        }
                        if (text.endsWith("\"")) {
                            text = text.substring(0, text.length - 1) + ""
                        }
                        Log.e("REQUIRED DATA:", text)
                        var dataNeedToDisplay: String = text
                        if (text.contains("\\n")) {
                            dataNeedToDisplay =
                                text.replace("\\n", System.getProperty("line.separator")!!)
                        }
                        deleteCurrentText(currentInputConnection)
                        Log.e("REQUIRED DATA:", dataNeedToDisplay)
                        currentInputConnection?.commitText(dataNeedToDisplay, 1)
                    } catch (e: IOException) {
                        e.printStackTrace()
                    }
                }
            }

            override fun onFailure(call: Call<JsonObject>, t: Throwable) {
                hideProgress()
                Log.e("onFailure: ", t.message.toString())

            }
        })
    }

    private fun generateSuggestionResponse(prompt: String) {
        val jsonObject = JsonObject()
        jsonObject.addProperty("text", prompt)
        jsonObject.addProperty("correctTypoInPartialWord", false)
        jsonObject.addProperty("language", "en")
        jsonObject.addProperty("maxNumberOfPredictions", 8)

        val call: Call<JsonObject> = ApiRetrofit.getSuggestionClient().requestSuggestion(jsonObject)
        call.enqueue(object : Callback<JsonObject> {
            override fun onResponse(call: Call<JsonObject>, response: Response<JsonObject>) {
                hideProgress()
                if (response.isSuccessful) {
                    try {
                        val responseString = response.body()
                        val predictionsObject = JSONObject(responseString.toString())
                        val predictionsArray = predictionsObject.getJSONArray("predictions")
                        val predictionsList = mutableListOf<String>()
                        for (i in 0 until predictionsArray.length()) {
                            val prediction =
                                predictionsArray.getJSONObject(i).getString("text")
                            predictionsList.add(prediction)
                        }
                        suggestionList = listOf()
                        suggestionList = if (predictionsList.size > 3) {
                            predictionsList.distinct().take(3)
                        } else {
                            predictionsList
                        }
                        myRvAdapter?.setItems(suggestionList)
                        Log.e("Suggestions:", suggestionList.toString())

                    } catch (e: IOException) {
                        e.printStackTrace()
                    }
                }
            }

            override fun onFailure(call: Call<JsonObject>, t: Throwable) {
                hideProgress()
                Log.e("onFailure: ", t.message.toString())

            }
        })
    }

    private fun showProgress(value: String) {
        when (value) {
            TRANSLATE -> {
                binding?.ivTranslate?.visibility = View.GONE
                binding?.translateProgress?.visibility = View.VISIBLE
            }
            GRAMMAR_CHECK -> {
                binding?.ivGrammarCheck?.visibility = View.INVISIBLE
                binding?.grammarCheckProgress?.visibility = View.VISIBLE
            }
            PARAPHRASE -> {
                binding?.ivParaphrase?.visibility = View.INVISIBLE
                binding?.paraphraseProgress?.visibility = View.VISIBLE
            }
            CONTINUE_WRITING -> {
                binding?.ivContinueWriting?.visibility = View.INVISIBLE
                binding?.continueWritingProgress?.visibility = View.VISIBLE
            }
            EMAIL_REPLY -> {
                binding?.ivEmailReplies?.visibility = View.INVISIBLE
                binding?.emailReplyProgress?.visibility = View.VISIBLE
            }
            HELP_ME_WRITE -> {
                binding?.ivHelpMeWrite?.visibility = View.INVISIBLE
                binding?.helpMeWriteProgress?.visibility = View.VISIBLE
            }
        }
    }

    private fun hideProgress() {
        if (binding?.translateProgress?.isVisible == true) {
            binding?.translateProgress?.visibility = View.GONE
            binding?.ivTranslate?.visibility = View.VISIBLE
        } else if (binding?.grammarCheckProgress?.isVisible == true) {
            binding?.grammarCheckProgress?.visibility = View.GONE
            binding?.ivGrammarCheck?.visibility = View.VISIBLE
        } else if (binding?.paraphraseProgress?.isVisible == true) {
            binding?.paraphraseProgress?.visibility = View.GONE
            binding?.ivParaphrase?.visibility = View.VISIBLE
        } else if (binding?.continueWritingProgress?.isVisible == true) {
            binding?.continueWritingProgress?.visibility = View.GONE
            binding?.ivContinueWriting?.visibility = View.VISIBLE
        } else if (binding?.emailReplyProgress?.isVisible == true) {
            binding?.emailReplyProgress?.visibility = View.GONE
            binding?.ivEmailReplies?.visibility = View.VISIBLE
        } else if (binding?.helpMeWriteProgress?.isVisible == true) {
            binding?.helpMeWriteProgress?.visibility = View.GONE
            binding?.ivHelpMeWrite?.visibility = View.VISIBLE
        }
    }

    fun replace(str: String, index: Int, replace: Char): String {
        if (index < 0 || index >= str.length) {
            return str
        }
        val chars = str.toCharArray()
        chars[index] = replace
        return String(chars)
    }

    override fun onSpinnerOpened(spinner: Spinner?) {
        Log.e("On Spinner Open: ", "Spinner is open")
    }

    override fun onSpinnerClosed(spinner: Spinner?) {
        Log.e("On Spinner Close: ", "Spinner is close")
    }


}
