package ai.genie.app

import android.app.Application
import android.content.Context
import android.os.Build
import java.util.*


class MainApp : Application() {

    /* companion object {
         val TAG: String = MainApp::class.java.simpleName

         lateinit var instance: MainApp

         fun getContext(): Context = instance.applicationContext

         fun getCurrentLocale(): Locale? {
             return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                 instance.resources.configuration.locales[0]
             } else {
                 instance.resources.configuration.locale
             }
         }

     }

     override fun setupKoinModule(koinApplication: KoinApplication) {
         koinApplication.modules(
             listOf(
                 delegateModule,
                 repositoryModule,
                 databaseModule,
                 viewModelModule,
             )
         )
     }

     override fun onCreate() {
         super.onCreate()
         instance = this
         setupEmojiCompat()
     }

     private fun setupEmojiCompat() {
         val config = BundledEmojiCompatConfig(this)
         EmojiCompat.init(config)
     }
 */
}

