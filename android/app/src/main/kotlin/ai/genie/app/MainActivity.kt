package ai.genie.app

import android.os.Bundle
import android.view.inputmethod.InputMethodManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private var data: Boolean = false
    override fun onCreate(savedInstanceState: Bundle?) {
        data = isInputEnabled()
        super.onCreate(savedInstanceState)
    }

    override fun onRestart() {
        data = isInputEnabled()
        super.onRestart()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        val channel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "genie.methodChannel")
        // Receive method invocations from Dart and return results.
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "checkKeyboardEnabled" -> result.success(data)
                else -> result.notImplemented()
            }
        }
        super.configureFlutterEngine(flutterEngine)
    }


    private fun isInputEnabled(): Boolean {
        var isInputEnabled = false
        val imm = getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager

        val mInputMethodProperties = imm.enabledInputMethodList
        for (i in mInputMethodProperties.indices) {
            val imi = mInputMethodProperties[i]
            if (imi.id.contains(packageName)) {
                isInputEnabled = true
            }
        }

        return isInputEnabled
    }

}
