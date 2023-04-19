package ai.genie.app.ui.main

import android.R
import android.annotation.SuppressLint
import android.content.Context
import android.content.res.Resources
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Rect
import android.graphics.drawable.Drawable
import android.view.GestureDetector
import android.view.MotionEvent
import android.view.View
import ai.genie.app.service.KeyboardIME


class SuggestionView(context: Context) : View(context) {
    private var mService: KeyboardIME? = null
    private var mSuggestions: List<String>? = null
    private var mSelectedIndex = 0
    private var mTouchX = OUT_OF_BOUNDS
    private val mSelectionHighlight: Drawable
    private var mTypedWordValid = false
    private var mBgPadding: Rect? = null
    private val mWordWidth = IntArray(MAX_SUGGESTIONS)
    private val mWordX = IntArray(MAX_SUGGESTIONS)
    private val mColorNormal: Int
    private val mColorRecommended: Int
    private val mColorOther: Int
    private val mVerticalPadding: Int
    private val mhorizentmargin = 0
    private val mPaint: Paint
    private var mScrolled = false
    private var mTargetScrollX = 0
    private var mTotalWidth = 0
    private val extraHeight = 1
//    private val mGestureDetector: GestureDetector

    /**
     * Construct a CandidateView for showing suggested words for completion.
     *
     * @param context
     */
    init {
        mSelectionHighlight = context.resources.getDrawable(
            R.drawable.bottom_bar
        )
        mSelectionHighlight.state = intArrayOf(
            R.attr.state_enabled, R.attr.state_focused,
            R.attr.state_window_focused, R.attr.state_pressed
        )

// background color of hints
        val r: Resources = context.resources
        setBackgroundColor(r.getColor(R.color.system_accent1_100))
        mColorNormal = r.getColor(R.color.background_light)
        mColorRecommended = r.getColor(R.color.background_dark)
        mColorOther = r.getColor(R.color.holo_green_dark)
        mVerticalPadding = r.getDimensionPixelSize(R.dimen.app_icon_size)
        mPaint = Paint()
        mPaint.color = mColorNormal
        mPaint.isAntiAlias = true
        mPaint.textSize = 12F
        mPaint.strokeWidth = 0F
 /*       mGestureDetector = GestureDetector(object : GestureDetector.SimpleOnGestureListener() {
            fun onScroll(
                e1: MotionEvent?, e2: MotionEvent?,
                distanceX: Float, distanceY: Float
            ): Boolean {
                mScrolled = true
                var sx: Int = scrollX
                sx += distanceX.toInt()
                if (sx < 0) {
                    sx = 0
                }
                if (sx + width > mTotalWidth) {
                    sx -= distanceX.toInt()
                }
                mTargetScrollX = sx
                scrollTo(sx, scrollY)
                invalidate()
                return true
            }
        })*/
        isHorizontalFadingEdgeEnabled = true
        setWillNotDraw(false)
        isHorizontalScrollBarEnabled = false
        isVerticalScrollBarEnabled = false
    }

    /**
     * A connection back to the service to communicate with the text field
     *
     * @param listener
     */
    fun setService(listener: KeyboardIME?) {
        mService = listener
    }

    override fun computeHorizontalScrollRange(): Int {
        return mTotalWidth
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val measuredWidth = resolveSize(50, widthMeasureSpec)

        // Get the desired height of the icon menu view (last row of items does
        // not have a divider below)
        val padding = Rect()
        mSelectionHighlight.getPadding(padding)
        val desiredHeight = mPaint.textSize as Int + mVerticalPadding

        // Maximum possible width and desired height
        setMeasuredDimension(
            measuredWidth,
            resolveSize(desiredHeight, heightMeasureSpec)
        )
    }

    /**
     * If the canvas is null, then only touch calculations are performed to pick the target
     * candidate.
     */
    override fun onDraw(canvas: Canvas?) {
        if (canvas != null) {
            super.onDraw(canvas)
        }
        mTotalWidth = 0
        if (mSuggestions == null) return
        if (mBgPadding == null) {
            mBgPadding = Rect(0, 0, 0, 0)
            /*if (StyleConstants.getBackground() != null) {
                StyleConstants.getBackground().getPadding(mBgPadding)
            }*/
        }
        var x = 0
        val count = mSuggestions!!.size
        val height = height
        val bgPadding: Rect? = mBgPadding
        val paint: Paint = mPaint
        val touchX = mTouchX
        val scrollX: Int = scrollX
        val scrolled = mScrolled
        val typedWordValid = mTypedWordValid
        val y = ((height - mPaint.textSize) / 2 - mPaint.ascent()) as Int
        for (i in 0 until count) {
            // Break the loop. This fix the app from crashing.
            if (i >= MAX_SUGGESTIONS) {
                break
            }
            val suggestion = mSuggestions!![i]
            val textWidth: Float = paint.measureText(suggestion)
            val wordWidth = textWidth.toInt() + X_GAP * 2
            mWordX[i] = x
            mWordWidth[i] = wordWidth
            paint.color = mColorNormal
            if (touchX + scrollX >= x && (touchX + scrollX < x + wordWidth) && !scrolled) {
                if (canvas != null) {
                    canvas.translate(x.toFloat(), 0F)
                    mSelectionHighlight.setBounds(0, 12, wordWidth, height)
                    mSelectionHighlight.draw(canvas)
                    canvas.translate((-x).toFloat(), 0F)
                }
                mSelectedIndex = i
            }
            if (canvas != null) {
                if (i == 1 && !typedWordValid || i == 0 && typedWordValid) {
                    paint.isFakeBoldText = true
                    paint.color = mColorRecommended
                } else if (i != 0) {
                    paint.color = mColorOther
                }
                canvas.drawText(suggestion, (x + X_GAP).toFloat(), y.toFloat(), paint)
                paint.color = mColorOther
                if (bgPadding != null) {
                    canvas.drawLine(
                        x + wordWidth + 0.5f, bgPadding.top.toFloat(),
                        x + wordWidth + 0.5f, (height + 10).toFloat(), paint
                    )
                }
                paint.isFakeBoldText = false
            }
            x += wordWidth
        }
        mTotalWidth = x
        if (mTargetScrollX != getScrollX()) {
            scrollToTarget()
        }
    }

    private fun scrollToTarget() {
        var sx: Int = scrollX
        if (mTargetScrollX > sx) {
            sx += SCROLL_PIXELS
            if (sx >= mTargetScrollX) {
                sx = mTargetScrollX
                requestLayout()
            }
        } else {
            sx -= SCROLL_PIXELS
            if (sx <= mTargetScrollX) {
                sx = mTargetScrollX
                requestLayout()
            }
        }
        scrollTo(sx, scrollY)
        invalidate()
    }

    fun setSuggestions(
        suggestions: List<String>?, completions: Boolean,
        typedWordValid: Boolean
    ) {
        clear()
        if (suggestions != null) {
            mSuggestions = ArrayList(suggestions)
        }
        mTypedWordValid = typedWordValid
        scrollTo(0, 0)
        mTargetScrollX = 0
        // Compute the total width
        draw(null)
        invalidate()
        requestLayout()
    }

    fun clear() {
        mSuggestions = EMPTY_LIST
        mTouchX = OUT_OF_BOUNDS
        mSelectedIndex = -1
        invalidate()
    }

    @SuppressLint("ClickableViewAccessibility")
    override fun onTouchEvent(me: MotionEvent): Boolean {
       /* if (mGestureDetector.onTouchEvent(me)) {
            return true
        }*/
        val action: Int = me.action
        val x = me.x.toInt()
        val y = me.y.toInt()
        mTouchX = x
        when (action) {
            MotionEvent.ACTION_DOWN -> {
                mScrolled = false
                invalidate()
            }
            MotionEvent.ACTION_MOVE -> {
                if (y <= 0) {
                    // Fling up!?
                    if (mSelectedIndex >= 0) {
//                        mService?.pickSuggestionManually(mSelectedIndex)
                        mSelectedIndex = -1
                    }
                }
                invalidate()
            }
            MotionEvent.ACTION_UP -> {
                if (!mScrolled) {
                    if (mSelectedIndex >= 0) {
//                        mService?.pickSuggestionManually(mSelectedIndex)
                    }
                }
                mSelectedIndex = -1
                removeHighlight()
                requestLayout()
            }
        }
        return true
    }

    /**
     * For flick through from keyboard, call this method with the x coordinate of the flick
     * gesture.
     *
     * @param x
     */
    fun takeSuggestionAt(x: Float) {
        mTouchX = x.toInt()
        // To detect candidate
        draw(null)
        if (mSelectedIndex >= 0) {
//            mService?.pickSuggestionManually(mSelectedIndex)
        }
        invalidate()
    }

    private fun removeHighlight() {
        mTouchX = OUT_OF_BOUNDS
        invalidate()
    }

    companion object {
        private const val OUT_OF_BOUNDS = -1
        private const val MAX_SUGGESTIONS = 4
        private const val SCROLL_PIXELS = 40
        private const val X_GAP = 95
        private val EMPTY_LIST: List<String> = ArrayList()
    }
}