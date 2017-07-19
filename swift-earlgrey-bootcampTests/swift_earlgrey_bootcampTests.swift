import XCTest
import EarlGrey

@testable import swift_earlgrey_bootcamp

class swift_earlgrey_bootcampTests: XCTestCase {
    
    let storyboard = UIStoryboard(name: "Main",
                                  bundle: Bundle.main)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStep0() {
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitHeader), grey_accessibilityLabel("Home")]))
        .assert(grey_sufficientlyVisible())
        for number in 1...4 {
            EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_accessibilityLabel("Step \(number)")]))
                .assert(grey_sufficientlyVisible())
        }
    }
    
    func testStep1() {
        let presentViewController = storyboard.instantiateViewController(withIdentifier: "Step1")
        let navigationController = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        navigationController.pushViewController(presentViewController, animated: false)
        
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityTrait(UIAccessibilityTraitButton), grey_accessibilityLabel("Home")]))
            .assert(grey_sufficientlyVisible())
        
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Check This"), grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_not(grey_anyOf([grey_kindOfClass(NSClassFromString("UIButtonLabel")!)])), grey_ancestor(grey_allOf([grey_kindOfClass(UIStackView.self), grey_descendant(grey_kindOfClass(UIButton.self))]))]))
            .assert(grey_sufficientlyVisible())
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Check This"), grey_accessibilityTrait(UIAccessibilityTraitButton)]))
            .assert(grey_sufficientlyVisible())
        
        EarlGrey.select(elementWithMatcher: grey_allOf([grey_accessibilityLabel("Check This"), grey_accessibilityTrait(UIAccessibilityTraitStaticText), grey_not(grey_anyOf([grey_kindOfClass(NSClassFromString("UITextFieldLabel")!)])), grey_ancestor(grey_allOf([grey_kindOfClass(UIStackView.self), grey_descendant(grey_kindOfClass(UITextField.self))]))]))
            .assert(grey_sufficientlyVisible())
        EarlGrey.select(elementWithMatcher: grey_accessibilityValue("Check This"))
            .assert(grey_sufficientlyVisible())
        
    }
}
