import Cocoa
import FlutterMacOS

public class WindowUtilsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "window_utils", binaryMessenger: registrar.messenger)
    let instance = WindowUtilsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "minimizeWindow":
      if let window = NSApplication.shared.mainWindow {
        window.orderBack(window)
      }
    case "setMinimumSize":
      if let window = NSApplication.shared.mainWindow {
        if let width: Float = (call.arguments as? [String: Any])?["width"] as? Float,
           let height: Float = (call.arguments as? [String: Any])?["height"] as? Float
           {
              window.minSize = CGSize(width:CGFloat(width), height:CGFloat(height))
           }
      }
    case "setFrameSize":
      if let window = NSApplication.shared.mainWindow {
        if let width: Float = (call.arguments as? [String: Any])?["width"] as? Float,
           let height: Float = (call.arguments as? [String: Any])?["height"] as? Float
           {
              var frame = window.frame
              frame.size = CGSize(width:CGFloat(width), height:CGFloat(height))
              window.setFrame(frame, display: true)
           }
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
