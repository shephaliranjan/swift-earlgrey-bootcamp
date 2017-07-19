# swift-earlgrey-bootcamp

Hello Reader(s). This bootcamp is intended to give you a starting point into the Earlgrey framework and other testing tools for iOS... but truly, it was more of a learning experience for us to create this! 

Here is an alterntive bootcamp if you find our intentions to be vile: [Original Earlgrey Bootcamp](https://github.com/pivotal-gordon-krull/earlgrey-bootcamp)

## What you will need to get started
- Xcode (Update to the latest version of Xcode)
- Access to an internet connection

# Getting started

## Step 0: Setup

### Resources:
- [Cocoapods](https://cocoapods.org/) **or** [Carthage](https://github.com/Carthage/Carthage)
- [EarlGrey Framework](https://github.com/google/EarlGrey)
- [Swift Doc](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309)

#### Objective:
- Set up EarlGrey framework on the sample app
- Add a test that launches the app and asserts all elements are displayed on the view

## Step 1: Actions and cocktail of Elements

### Resources:
- [iOS Accessibility Inspector](https://developer.apple.com/library/content/documentation/Accessibility/Conceptual/AccessibilityMacOSX/OSXAXTestingApps.html) 
- [EarlGrey Cheat Sheet](https://github.com/google/EarlGrey/blob/master/docs/cheatsheet/cheatsheet.png)

#### Objective:
- Add a test to select 'Step 1' and assert all elements are displayed on the view 

## Step 2: Let the good times Scroll

### Resources:
- [Explore this repository!](https://github.com/google/EarlGrey)

#### Objective:
- Add a test to select 'Step 2' and assert '100' is displayed in the scrollable list

## Step 3: OHHTTPStubs you glad I didn't say banana?

### Resources:
- [OHHTTPStubs](https://github.com/AliSoftware/OHHTTPStubs)
- [Charles Proxy](https://www.charlesproxy.com/documentation/)

#### Objective:
- Add OHHTTPStubs as a testing dependency
- Add a test to select 'Step 3' and stub the network call returning weather data to display custom data
- Assert that the page displays the updated values

## Step 4: Date you glad I didn't say Condition?

### Resources
- [Explore this repository some more!](https://github.com/google/EarlGrey)

#### Objective
- Add a test to select 'Step 4' and tap the button displayed until the current date and time is displayed (assert this too)

## Step 5: Refactor and go home

## Resources
- [Really none needed]()

#### Objective
- Use setup() and tearDown() to remove any unnecessary dependencies in tests
- Call it a day 