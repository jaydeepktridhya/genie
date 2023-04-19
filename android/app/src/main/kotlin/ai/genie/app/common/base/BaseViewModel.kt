package ai.genie.app.common.base

import android.content.Context
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel


open class BaseViewModel(mContext: Context) : ViewModel() {
    val isLoading: MutableLiveData<Boolean> = MutableLiveData()
    init {
        isLoading.observeForever {
            isLoading.value = false
        }
    }

}