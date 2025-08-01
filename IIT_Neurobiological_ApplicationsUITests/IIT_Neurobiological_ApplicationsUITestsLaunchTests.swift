//
//  IIT_Neurobiological_ApplicationsUITestsLaunchTests.swift
//  IIT_Neurobiological_ApplicationsUITests
//
//  Created by Cong Le on 6/30/25.
//

import XCTest

final class IIT_Neurobiological_ApplicationsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
