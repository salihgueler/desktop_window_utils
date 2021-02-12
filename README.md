# Desktop Window Utils (MacOS only for now)
A plugin for you to control the windows, their properties and toolbar/titlebars.

![Showcase](assets/long_showcase.gif)

## How to use it? 

You need to add the dependency to your project.

**Also, please keep in mind that the implementation has been only made for macOS.** 

## Features 

The library supports right now the following features:

```
dependencies:
  desktop_window_utils: ^0.0.2
```
And import: 
```dart
import 'package:desktop_window_utils/desktop_window_utils.dart';
```

### Setting the minimum frame size

Helps you to define a minimum window size for the window.

It expects two required fields. Height and width for the window. 

```dart
DesktopWindowUtils.setMinimumSize(height: 300, width: 300);
```
### Setting the screen size programmatically

Helps you to define the window size for the window programmatically.

It expects two required fields. Height and width for the window.

```dart
DesktopWindowUtils.setFrameSize(height: 400, width: 400);
```

### Closing the current window

Helps you to close the current window programmatically.

```dart
DesktopWindowUtils.closeWindow();
```

**You might have a problem to bring back to windows due to a macOS limitation. You should add the following code to your "macos/Runner/AppDelegate.swift" file for handling the window operations.**

```swift
override func applicationShouldHandleReopen(_: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
  if !flag {
      for window: AnyObject in NSApplication.shared.windows {
          window.makeKeyAndOrderFront(self)
      }
  }
  return true
}
```

### Minimizing the current window

Helps you to minimize the current window programmatically.

```dart
DesktopWindowUtils.minimizeWindow();
```

**You might have a problem to bring back to windows due to a macOS limitation. You should add the following code to your "macos/Runner/AppDelegate.swift" file for handling the window operations.**

```swift
override func applicationShouldHandleReopen(_: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
  if !flag {
      for window: AnyObject in NSApplication.shared.windows {
          window.makeKeyAndOrderFront(self)
      }
  }
  return true
}
```

### Bringing back the current window
Helps you to open/bring back the current window programmatically regardless of its state (miniaturized or closed).

```dart
DesktopWindowUtils.openWindow();
```

### Using toolbar instead of a titlebar
Helps you to enable Toolbar view instead of a Titlebar for macOS apps (which comes as default).

```dart
DesktopWindowUtils.useToolbar(isUsingToolbar: true);
```
### Removing toolbar/titlebar divider
Removed the divider from the toolbar or titlebar (picks whatever you are using).

Uses the variable `isDividerInvisible` for showing or hiding the divider.

Uses the variable `isUsingToolbar` for enabling toolbar.

```dart
DesktopWindowUtils.setTopbarSpecifications(
  isDividerInvisible: true,
  isUsingToolbar: true,
);
```

## Upcoming features
- [ ] Translucent Window
- [ ] Translucent Toolbar/Titlebar
- [ ] Custom background color for Toolbar/Titlebar

LICENSE
=========
Window Utils is licensed under the Apache License, Version 2.0. See
[LICENSE](https://github.com/salihgueler/desktop_window_utils/blob/main/LICENSE) for the full
license text.