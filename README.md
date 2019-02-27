# FixedIncomeSimulator

This is a learning repository to apply MVVM pattern

## Installation

This project uses [Bundler](http://bundler.io) and [CocoaPods](https://cocoapods.org). So run the following commands to install it.

`bundle`

`bundle exec pod install`

## Tests & Coverage

You can run all tests anytime. Just run the following command on your terminal.

`bundle exec fastlane test`

OBS: Tests using Nimble-Snapshots must run on iPhone 8 Plus (12.1), because the tests were written to this setup.

## Libs

This project uses the libraries below:

[Reusable](https://github.com/AliSoftware/Reusable) - Used to create cells in order to facilitate the 'Register/Dequeue'.

[SwiftLint](https://github.com/realm/SwiftLint) - Used to reinforces the good practices of the swift.

[IQKeyboardManagerSwift](https://github.com/hackiftekhar/IQKeyboardManager) - Used to manipulate the scrollView when the user is editing a textField.

[Quick](https://github.com/Quick/Quick) - Used to create more readable tests.

[Nimble](https://github.com/Quick/Nimble) - Used to create more readable tests.

[Nimble-Snapshots](https://github.com/ashfurrow/Nimble-Snapshots) - Used to record snapshots to identify changes in their layout.

[KIF](https://github.com/kif-framework/KIF) - Used to create instrumental tests.

[KIF-Quick](https://github.com/doordash/KIF-Quick) - Used to create more readable instrumental tests.
