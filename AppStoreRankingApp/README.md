# AppStoreRankingApp

This is a simple SwiftUI iOS app that fetches the top free apps from Apple's RSS feed and displays them in a list. Tapping an item opens the app's App Store page.

## Usage
1. Open `AppStoreRankingApp` folder in Xcode as a new project.
2. Ensure your deployment target is iOS 14 or later.
3. Build and run on a simulator or device.

The network request uses `https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json` to retrieve the top free apps in the U.S. store.
