# InstaFocus - No Reels and Explore Page

A minimalist Instagram experience built with Flutter. No reels, no explore tab – just essential information and messages.

# Installation

1. Clone the Repository

git clone https://github.com/your-username/instafocus.git
cd instafocus

2. Install Dependencies

flutter pub get

3. Connect Your iPhone and Build

Prerequisites:
macOS with Xcode
Flutter installed (Flutter installation guide)
An Apple ID (free Developer Account)
A physical iPhone

Steps:

Open the Xcode workspace:
open ios/Runner.xcworkspace
In Xcode:
Go to Xcode > Settings > Accounts and add your Apple ID if not added
Go to the Signing & Capabilities tab in the project
Select your Apple Team in the dropdown
Choose your connected iPhone as the target device (top bar)
Click the Run ▶️ button



## How I created this

1. Setup Flutter Development Environment (on macOS)
- Installed Flutter, VS Code, CocoaPods, and Xcode.
- Configured iOS simulator and Flutter toolchain with flutter doctor.

- Created a new Flutter project:
'''flutter create insta_cleaner'''

2. Built a Custom WebView App
- Used webview_flutter to embed Instagram’s website.

Injected JavaScript to:
- Remove Reels and Explore links.

3. Styled the App
- AppBar color to black with a title.

4. Tested and Debugged
- Ran the app on iOS Simulator successfully.

5. Prepared for iPhone Deployment
- Opened the project in Xcode via Runner.xcworkspace.
- Added your Apple ID under Xcode > Settings > Accounts.
- Set your real iPhone as the run target to deploy the app on your device.
