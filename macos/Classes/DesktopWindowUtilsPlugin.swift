import Cocoa
import FlutterMacOS

public class DesktopWindowUtilsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "desktop_window_utils", binaryMessenger: registrar.messenger)
        let instance = DesktopWindowUtilsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "closeWindow":
            if let window = NSApplication.shared.mainWindow {
                result(true)
                window.close()
            } else {
                result(false)
            }
        case "minimizeWindow":
            if let window = NSApplication.shared.mainWindow {
                result(true)
                window.miniaturize(self)
            } else {
                result(false)
            }
        case "showWindow":
            NSApplication.shared.activate(ignoringOtherApps: true)
            if let window = NSApplication.shared.mainWindow {
                if window.isMiniaturized {
                    result(true)
                    window.deminiaturize(self)
                } else {
                    result(true)
                    window.makeKeyAndOrderFront(self)
                }
            } else {
                 result(false)
            }
        case "setMinimumSize":
            if let window = NSApplication.shared.mainWindow {
                if let width: Float = (call.arguments as? [String: Any])?["width"] as? Float,
                   let height: Float = (call.arguments as? [String: Any])?["height"] as? Float
                {
                    result(true)
                    window.minSize = CGSize(width:CGFloat(width), height:CGFloat(height))
                } else {
                    result(false)
                }
            } else {
                    result(false)
            }
        case "setFrameSize":
            if let window = NSApplication.shared.mainWindow {
                if let width: Float = (call.arguments as? [String: Any])?["width"] as? Float,
                   let height: Float = (call.arguments as? [String: Any])?["height"] as? Float
                {
                    result(true)
                    var frame = window.frame
                    frame.size = CGSize(width:CGFloat(width), height:CGFloat(height))
                    window.setFrame(frame, display: true)
                } else {
                    result(false)
                }
            } else {
                result(false)
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
                            let customToolbar = NSToolbar.init(identifier: NSToolbar.Identifier("DesktopWindowUtils"))
                            customToolbar.allowsUserCustomization = true
                            if let isDividerInvisible: Bool = (call.arguments as? [String: Any])?["isDividerInvisible"] as? Bool {
                                customToolbar.showsBaselineSeparator = !isDividerInvisible
                                window.titlebarAppearsTransparent = isDividerInvisible
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
