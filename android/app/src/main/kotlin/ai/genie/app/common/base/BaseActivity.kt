package ai.genie.app.common.base

import android.os.Bundle
import androidx.viewbinding.ViewBinding
import ai.genie.app.BuildConfig

abstract class BaseActivity<VB : ViewBinding> {

    open fun initView() {}

}