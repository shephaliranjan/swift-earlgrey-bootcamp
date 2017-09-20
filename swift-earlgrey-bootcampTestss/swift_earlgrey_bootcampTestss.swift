//
//  swift_earlgrey_bootcampTestss.swift
//  swift-earlgrey-bootcampTestss
//
//  Created by Pivotal on 9/12/17.
//
//

import XCTest
import EarlGrey

class swift_earlgrey_bootcampTestss: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStep0() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        EarlGrey.select(elementWithMatcher: grey_text("Home")).assert(grey_sufficientlyVisible())
        EarlGrey.select(elementWithMatcher: grey_text("Step 1")).assert(grey_sufficientlyVisible())
        EarlGrey.select(elementWithMatcher: grey_text("Step 2")).assert(grey_sufficientlyVisible())
        EarlGrey.select(elementWithMatcher: grey_text("Step 3")).assert(grey_sufficientlyVisible())
        EarlGrey.select(elementWithMatcher: grey_text("Step 4")).assert(grey_sufficientlyVisible())
    }
    
    func testStep1_Click(){
        
        //EarlGrey.select(elementWithMatcher: grey_text("Step 1")).
        
        EarlGrey.select(elementWithMatcher: grey_text("Step 1")).perform(grey_tap())
        
        EarlGrey.select(elementWithMatcher: grey_text("Home")).assert(grey_sufficientlyVisible())
        
        //UI element 1
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_ancestor(grey_allOf([grey_kindOfClass(UIStackView.self),grey_descendant(grey_kindOfClass(UIButton.self))])),grey_accessibilityLabel("Check This"),grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_not(grey_kindOfClass(NSClassFromString("UIButtonLabel")!))])).assert(grey_sufficientlyVisible())
        
        //UI element 3
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_ancestor(grey_allOf([grey_kindOfClass(UIStackView.self),grey_descendant(grey_kindOfClass(UITextField.self))])), grey_accessibilityLabel("Check This"),grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_not(grey_kindOfClass(NSClassFromString("UITextFieldLabel")!))])).assert(grey_sufficientlyVisible())
        
        //UI element 2 - button
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_ancestor(grey_kindOfClass(UIButton.self)), grey_accessibilityLabel("Check This"), grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_text("Check This")])).assert(grey_sufficientlyVisible())
        
        //UI element 4
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_ancestor(grey_kindOfClass(UITextField.self)), grey_accessibilityLabel("Check This"), grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_text("Check This")])).assert(grey_sufficientlyVisible())
        
        //UI element 2 - tap button
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_ancestor(grey_kindOfClass(UIButton.self)), grey_accessibilityLabel("Check This"), grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_text("Check This")])).assert(grey_sufficientlyVisible()).perform(grey_tap())
        EarlGrey.select(elementWithMatcher: grey_text("Button pressed")).assert(grey_sufficientlyVisible())
        
        //UI element 4 - enter text
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_ancestor(grey_kindOfClass(UITextField.self)), grey_accessibilityLabel("Check This"), grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_text("Check This")])).perform(grey_tap())//.perform(grey_replaceText("a"))
        
        EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("a")).perform(grey_tap())
        
        EarlGrey.select(elementWithMatcher: grey_accessibilityID("Done")).assert(grey_sufficientlyVisible()).perform(grey_tap())
        
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_not(grey_kindOfClass(NSClassFromString("UITextFieldLabel")!)), grey_text("Check Thisa")])).assert(grey_sufficientlyVisible())
        
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_not(grey_kindOfClass(NSClassFromString("UITextFieldLabel")!)), grey_text("Check Thisa")])).perform(grey_replaceText("b"))
        
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_not(grey_kindOfClass(NSClassFromString("UITextFieldLabel")!)), grey_text("b")])).assert(grey_sufficientlyVisible())
    }
    
    
    func testStep2_Click(){
        EarlGrey.select(elementWithMatcher: grey_text("Step 2")).perform(grey_tap())
        
        //Set the timeoutfor the scrolling search to 60 sec
        GREYConfiguration.sharedInstance().setValue(60.0, forConfigKey:  kGREYConfigKeyInteractionTimeoutDuration)
        EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("100")).using(searchAction: grey_scrollInDirection(GREYDirection.down, 600), onElementWithMatcher: grey_kindOfClass(UITableView.self)).assert(grey_notNil())
        //Resets the timeout back to the default 30 sec
        GREYConfiguration.sharedInstance().setValue(30.0, forConfigKey:  kGREYConfigKeyInteractionTimeoutDuration)
    }
    func testStep3_Click(){
        
        
    }
    func testStep4_Click(){
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
