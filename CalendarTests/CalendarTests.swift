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
    
    var sut: PageViewController!
    var appDelegate: AppDelegate!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = PageViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func testOpenViewControllerFromDelegate() {
        //given
        appDelegate = AppDelegate()
        let viewController = PageViewController()
        //when
        appDelegate.addRootViewController(viewController: viewController)
        //then
        XCTAssertEqual(appDelegate.window?.rootViewController, viewController)
        appDelegate = nil
    }

    func testAddPageControl() {
        //given
        let pageControl = UIPageControl()
        //when
        sut.setupPageControl(pageControl: pageControl)
        //then
        XCTAssertTrue(sut.view.subviews.contains(pageControl))
    }

    func testSetupPageViewControllerDelegatesAndFirstScreen() {
        //given
        let array = [sut.firstViewController, sut.secondViewController, sut.thirdViewController, sut.fourthViewController]
        //when
        sut.setupPageViewControllerDelegatesAndFirstScreen(viewControllersArray: array)
        //then
        XCTAssertEqual(sut.viewControllers![0], array[0])
        XCTAssertNotNil(sut.delegate)
        XCTAssertNotNil(sut.dataSource)
    }

    func testAddButton() {
        //given
        let button = UIButton()
        //when
        sut.setupButton(button: button)
        //then
        XCTAssertTrue(sut.view.subviews.contains(button))
    }

    func testTapButton() {
        //given
           //call this to load the view, so the viewControllers in PageViewController
        let _ = sut.view
        guard let currentViewController = sut.viewControllers?.first else { return }
        XCTAssertEqual(sut.viewControllers?.first, sut.orderedViewControllers[0])
        //when
        sut.tapButton()
        //then
        XCTAssertNotEqual(currentViewController, sut.orderedViewControllers[1])
        XCTAssertEqual(sut.viewControllers?.first, sut.orderedViewControllers[1])
    }

    func testChangeButtonTitle() {
        //given
        let _ = sut.view
        let desirableViewController = sut.orderedViewControllers[3]
        guard let index = sut.orderedViewControllers.firstIndex(of: desirableViewController) else { return }
        XCTAssertEqual(sut.pageButton.titleLabel?.text!, "Start")
        //when
        sut.setViewControllers([desirableViewController], direction: .forward, animated: false) { (bool) in
            self.sut.pagePageControl.currentPage = index
            self.sut.changeButtonTitle()
        }
        //then
        XCTAssertEqual(sut.pageButton.titleLabel?.text!, "Enter")
        XCTAssertNotEqual(sut.pageButton.titleLabel?.text!, "Next")
        XCTAssertNotEqual(sut.pageButton.titleLabel?.text!, "Start")
    }

    func testSetupNewViewController() {
        //given
        var newViewController: OnboardingViewController
        //when
        newViewController = OnboardingViewController(textTitle: "Title", description: "Description")
        //then
        XCTAssertEqual(newViewController.textTitle?.text, "Title")
        XCTAssertEqual(newViewController.textDescription?.text, "Description")
        XCTAssertTrue(newViewController.view.subviews.contains(newViewController.imageView!))
    }
    
    func testCalculatePageControlHeight() {
        //given
        //when
        let returnValue = calculatePageControlTopSpacing()
        sut.view.layoutSubviews()
        //then
        XCTAssertEqual(returnValue, sut.pagePageControl.frame.origin.y - sut.pageButton.frame.maxY)
    }
    
    func testCalculateButtonSideSpacing() {
        //given
        //when
        sut.view.layoutSubviews()
        let returnValue = ceil(calculateButtonSideSpacing())
        let value = sut.pageButton.frame.origin.x
        print(returnValue)
        print(value)
        //then
        XCTAssertEqual(returnValue, value)
    }
    
    func testCalculateButtonHeight() {
        //given
        //when
        sut.view.layoutSubviews()
        let returnValue = calculateButtonHeight()
        let buttonHeight = sut.pageButton.frame.height
        //then
        XCTAssertEqual(returnValue, buttonHeight)
    }
    
    func testCalculateButtonTopSpacing() {
        //given
        //when
        sut.view.layoutSubviews()
        let returnValue = calculateButtonTopSpacing()
        let buttonY = sut.pageButton.frame.origin.y
        //then
        XCTAssertEqual(returnValue, buttonY)
    }
    
}



