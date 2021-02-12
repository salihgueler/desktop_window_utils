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
        case "closeWindow":
            if let window = NSApplication.shared.mainWindow {
                window.close()
            }
        case "minimizeWindow":
            if let window = NSApplication.shared.mainWindow {
                window.miniaturize(self)
            }
        case "showWindow":
            if let window = NSApplication.shared.mainWindow {
                if window.isMiniaturized {
                    window.deminiaturize(self)
                } else {
                    window.makeKeyAndOrderFront(self)
                }
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
        case "useToolbar":
            if let window = NSApplication.shared.mainWindow {
                if #available(macOS 10.13, *) {

                    if let isUsingToolbar: Bool = (call.arguments as? [String: Any])?["isUsingToolbar"] as? Bool {
                        if isUsingToolbar {
                            let customToolbar = NSToolbar()
                            window.titleVisibility = .hidden
                            window.toolbar = customToolbar
                        }
                    }
                }
            }
        case "setTopbarSpecifications":
            if let window = NSApplication.shared.mainWindow {
                if #available(macOS 10.13, *) {

                    if let isUsingToolbar: Bool = (call.arguments as? [String: Any])?["isUsingToolbar"] as? Bool {
                        if isUsingToolbar {
                            let customToolbar = NSToolbar()
                            if let isDividerInvisible: Bool = (call.arguments as? [String: Any])?["isDividerInvisible"] as? Bool {
                                customToolbar.showsBaselineSeparator = !isDividerInvisible
                            }
                            window.titleVisibility = .hidden
                            window.toolbar = customToolbar
                        } else {
                           window.titlebarAppearsTransparent = true
                        }
                    }
                }
            }


            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
