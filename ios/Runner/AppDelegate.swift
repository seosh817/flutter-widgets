import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     
    let controller: FlutterViewController = self.window.rootViewController as! FlutterViewController
     
    let channel = FlutterMethodChannel.init(name: "com.seosh817/value", binaryMessenger: controller.binaryMessenger)
    
    channel.setMethodCallHandler { (FlutterMethodCall, FlutterResult) in
        if(FlutterMethodCall.method == "getValue") {
            FlutterResult("성공")
        } else {
            FlutterResult(FlutterMethodNotImplemented)
        }
    }
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
