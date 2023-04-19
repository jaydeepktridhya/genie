package ai.genie.app.service

import android.annotation.SuppressLint
import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import android.widget.Spinner
import ai.genie.app.R
import java.util.jar.Attributes

@SuppressLint("AppCompatCustomView")
open class CustomSpinner(context: Context) : Spinner(context) {

    init {
        val layoutId = R.layout.custom_spinner
        inflate(context, layoutId, this)
    }

    /**
     * An interface which a client of this Spinner could use to receive
     * open/closed events for this Spinner.
     */
    interface OnSpinnerEventsListener {
        /**
         * Callback triggered when the spinner was opened.
         */
        fun onSpinnerOpened(spinner: Spinner?)

        /**
         * Callback triggered when the spinner was closed.
         */
        fun onSpinnerClosed(spinner: Spinner?)
    }

    var mListener: OnSpinnerEventsListener? = null
    private var mOpenInitiated = false

    // implement the Spinner constructors that you need
    override fun performClick(): Boolean {
        // register that the Spinner was opened so we have a status
        // indicator for when the container holding this Spinner may lose focus
        mOpenInitiated = true
        if (mListener != null) {
            mListener!!.onSpinnerOpened(this)
        }
        return super.performClick()
    }

    override fun onWindowFocusChanged(hasFocus: Boolean) {
        if (hasBeenOpened() && hasFocus) {
            performClosedEvent()
        }
    }

    /**
     * Register the listener which will listen for events.
     */
    fun setSpinnerEventsListener(
        onSpinnerEventsListener: OnSpinnerEventsListener?
    ) {
        mListener = onSpinnerEventsListener
    }

    /**
     * Propagate the closed Spinner event to the listener from outside if needed.
     */
    fun performClosedEvent() {
        mOpenInitiated = false
        if (mListener != null) {
            mListener!!.onSpinnerClosed(this)
        }
    }

    /**
     * A boolean flag indicating that the Spinner triggered an open event.
     *
     * @return true for opened Spinner
     */
    fun hasBeenOpened(): Boolean {
        return mOpenInitiated
    }
}