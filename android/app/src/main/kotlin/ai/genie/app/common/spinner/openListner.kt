package ai.genie.app.common.spinner

import android.view.MotionEvent
import android.view.View
import android.widget.AdapterView
import android.widget.Spinner

internal abstract class OnOpenListener(spinner: Spinner) : View.OnTouchListener,
    AdapterView.OnItemSelectedListener {
    init {
        spinner.setOnTouchListener(this)
        spinner.onItemSelectedListener = this
    }

    override fun onTouch(v: View?, event: MotionEvent): Boolean {
        if (event.action == MotionEvent.ACTION_UP) {
            onOpen()
        }
        return false
    }

    override fun onItemSelected(arg0: AdapterView<*>?, arg1: View?, arg2: Int, arg3: Long) {
        onClose()
    }

    override fun onNothingSelected(arg0: AdapterView<*>?) {
        onClose()
    }

    abstract fun onOpen()
    abstract fun onClose()
}