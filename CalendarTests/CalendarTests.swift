//
//  CalendarTests.swift
//  CalendarTests
//
//  Created by Michał Wziątek on 25/08/2019.
//  Copyright © 2019 Michał Wziątek. All rights reserved.
//

import XCTest
@testable import Calendar

class CalendarTests: XCTestCase {
    
    var appDelegate: AppDelegate!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        appDelegate = AppDelegate()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        appDelegate = nil
        super.tearDown()
    }

    func launchRootViewControllerFromAppDelegate() {
        let viewController = PageViewController()
        appDelegate.window?.rootViewController = viewController
        appDelegate.window?.makeKeyAndVisible()
        
        XCTAssertNotNil(appDelegate.window?.rootViewController, "RootViewController is nil")
    }

}
