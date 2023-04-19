import UIKit
import Flutter
import FirebaseCore
import MobileCoreServices
import GenieKeyboard
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let deviceChannel = FlutterMethodChannel(name: "genie.methodChannel",
                                                 binaryMessenger: controller.binaryMessenger)
        prepareMethodHandler(deviceChannel: deviceChannel)
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func prepareMethodHandler(deviceChannel: FlutterMethodChannel) {
        deviceChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if call.method == "openSettings" {
                NSLog("Open settings");
                self.openSettings(result:result)
            }  else if call.method == "checkKeyboardEnabled" {
                NSLog("isKeyboardCurrentInUsed",self.isKeyboardExtensionEnabled());
                result(Bool(self.isKeyboardExtensionEnabled()))
            } else if call.method == "isEnabledFullAccess" {
                NSLog("isEnabledFullAccess",Bool(self.checkFullAccess()));
                result(Bool(self.checkFullAccess()))
            }
            else {
                result(FlutterMethodNotImplemented)
                return
            }
            
        })
    }
    
    private func openSettings(result: FlutterResult) {
        if #available(iOS 10.0, *) {
            let settingsUrl = NSURL(string:UIApplication.openSettingsURLString)! as URL
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
        }
    }
    
    func isKeyboardExtensionEnabled() -> Bool {
        // Check our custom keyboard added in Keyboard list or not from setting.
        guard let appBundleIdentifier = Bundle.main.bundleIdentifier else {
            fatalError("isKeyboardExtensionEnabled(): Cannot retrieve bundle identifier.")
        }
        guard let keyboards = UserDefaults.standard.dictionaryRepresentation()["AppleKeyboards"] as? [String] else {
            // There is no key `AppleKeyboards` in NSUserDefaults. That happens sometimes.
            return false
        }
        let keyboardExtensionBundleIdentifierPrefix = appBundleIdentifier + "."
        for keyboard in keyboards {
            if keyboard.hasPrefix(keyboardExtensionBundleIdentifierPrefix) {
                print("Keyboard is enabled")
                return true
            }
        }
        return false
    }
    
    func checkFullAccess() -> Bool
    {
        print(UIInputViewController().hasFullAccess)
        return UIInputViewController().hasFullAccess
    }
}
