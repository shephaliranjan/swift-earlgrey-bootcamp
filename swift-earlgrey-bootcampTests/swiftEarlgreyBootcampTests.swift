//
//  swift_earlgrey_bootcampTest.swift
//  swift-earlgrey-bootcampTest
//
//  Created by Pivotal on 9/12/17.
//
//

import XCTest
import EarlGrey
import OHHTTPStubs


class swiftEarlgreyBootcampTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
        // this we have added to navigate to home page after execution of each testcase
         EarlGrey.select(elementWithMatcher: grey_text("Home")).perform(grey_tap())
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
        EarlGrey.select(elementWithMatcher: grey_text("Step 1")).perform(grey_tap())
        
        EarlGrey.select(elementWithMatcher: grey_text("Home")).assert(grey_sufficientlyVisible())
        
        //UI element 1
        EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("This is a Label")).assert(grey_sufficientlyVisible())
        
        //UI Element 2
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_text("This is a disabled Text Field"),grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible())
        
        //UI element 3
        EarlGrey.select(elementWithMatcher: grey_text("This is a disabled Button")).assert(grey_sufficientlyVisible())
        
    }
    
    
    func testStep2_Click(){
        EarlGrey.select(elementWithMatcher: grey_text("Step 2")).perform(grey_tap())
        
        //Set the timeoutfor the scrolling search to 60 sec
        GREYConfiguration.sharedInstance().setValue(60.0, forConfigKey:  kGREYConfigKeyInteractionTimeoutDuration)
        
        EarlGrey.select(elementWithMatcher: grey_accessibilityLabel("50")).using(searchAction: grey_scrollInDirection(GREYDirection.down, 600), onElementWithMatcher: grey_kindOfClass(UITableView.self)).assert(grey_notNil())
        
        //Resets the timeout back to the default 30 sec
        GREYConfiguration.sharedInstance().setValue(30.0, forConfigKey:  kGREYConfigKeyInteractionTimeoutDuration)
    }
    func testStep3_Click(){
        
        stub(condition:isHost("api.openweathermap.org")) { request in
            // Stub it with our "wsresponse.json" stub file
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile("wsresponse.json", type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type":"application/json"]
            )
        }
        
        EarlGrey.select(elementWithMatcher: grey_text("Step 3")).perform(grey_tap())
        
        //UI element 1, this is failing, because there are duplicate entries in the hierarchy view
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_text("Temperature: 100.74 K"),grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible())
         EarlGrey.select(elementWithMatcher: grey_allOf([grey_text("Pressure: 2000 K"),grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible())
         EarlGrey.select(elementWithMatcher: grey_allOf([grey_text("Humidity: 99 %"),grey_accessibilityTrait(UIAccessibilityTraitStaticText)])).assert(grey_sufficientlyVisible())
    }
    func testStep4_Click(){
        EarlGrey.select(elementWithMatcher: grey_text("Step 4")).perform(grey_tap())
        EarlGrey.select(elementWithMatcher: grey_text("Select Button")).assert(grey_sufficientlyVisible())
       
        
        let _ = GREYCondition(name: "Tap until we see check date", block: {
            var error:NSError?
            
            EarlGrey.select(elementWithMatcher: grey_text("Button")).perform(grey_tap())
            
            EarlGrey.select(elementWithMatcher: grey_text("Check Date")).assert(with: grey_notNil(), error: &error)
            return error == nil
                
            }).wait(withTimeout: 5.0)

         EarlGrey.select(elementWithMatcher: grey_text("Check Date")).assert(grey_sufficientlyVisible())
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEE, MMM d, YYYY, kk:mm"
        let dateIs = dateFormatter.string(from: Date())
        
        EarlGrey.select(elementWithMatcher: grey_text(dateIs)).assert(grey_sufficientlyVisible())
    }
    
    
    func testStep5_Click(){
        EarlGrey.select(elementWithMatcher: grey_text("Step 5")).perform(grey_tap())
        
       
        
        //UI element 1
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_text("Check This"), grey_kindOfClass(UILabel.self), grey_not(grey_kindOfClass(NSClassFromString("UITextFieldLabel")!)), grey_accessibilityTrait(UIAccessibilityTraitStaticText),grey_accessibilityLabel("Check This"), grey_ancestor(grey_allOf([grey_kindOfClass(UIStackView.self),grey_descendant(grey_kindOfClass(UITextField.self))]))])).assert(grey_sufficientlyVisible())
        
        //UI element 2
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Check This"),grey_accessibilityTrait(UIAccessibilityTraitButton)])).perform(grey_tap());
        
        EarlGrey.select(elementWithMatcher: grey_text("Button pressed")).assert(grey_sufficientlyVisible())
        
        //UI element 3
         EarlGrey.select(elementWithMatcher: grey_allOf([grey_text("Check This"),grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_ancestor(grey_allOf([grey_kindOfClass(UIStackView.self),grey_descendant(grey_kindOfClass(UIButton.self))]))])).assert(grey_sufficientlyVisible())
        
        
        // UI element 4
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_text("Check This"), grey_kindOfClass(UITextField.self)])).assert(grey_sufficientlyVisible())
    }
    
    
}
