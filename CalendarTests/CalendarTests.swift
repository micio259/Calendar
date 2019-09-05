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
        XCTAssertEqual(button.titleLabel?.text!, "Start")
        //when
        sut.setViewControllers([desirableViewController], direction: .forward, animated: false) { (bool) in
            pageControl.currentPage = index
            self.sut.changeButtonTitle()
        }
        //then
        XCTAssertEqual(button.titleLabel?.text!, "Enter")
        XCTAssertNotEqual(button.titleLabel?.text!, "Next")
        XCTAssertNotEqual(button.titleLabel?.text!, "Start")
    }

    func testSetupNewViewController() {
        //given
        var newViewController: OnboardingViewController
        //when
        newViewController = OnboardingViewController(textTitle: "Title", description: "Description")
        //then
        XCTAssertEqual(newViewController.onboardingTextTitle?.text, "Title")
        XCTAssertEqual(newViewController.onboardingTextDescription?.text, "Description")
        XCTAssertTrue(newViewController.view.subviews.contains(newViewController.onboardingImageView!))
    }
    
    func testCalculatePageControlHeight() {
        //given
        //when
        let returnValue = calculatePageControlTopSpacing().rounded()
        
        sut.view.layoutSubviews()
        //then
        XCTAssertEqual(returnValue, pageControl.frame.origin.y - button.frame.maxY)
    }
    
    func testCalculateButtonSideSpacing() {
        //given
        //when
        sut.view.layoutSubviews()
        let returnValue = ceil(calculateButtonSideSpacing())
        let value = button.frame.origin.x
        print(returnValue)
        print(value)
        //then
        XCTAssertEqual(returnValue, value)
    }
    
    func testCalculateButtonHeight() {
        //given
        //when
        sut.view.layoutSubviews()
        let returnValue = calculateButtonHeight().rounded(.up)
        let buttonHeight = button.frame.height.rounded()
        //then
        XCTAssertEqual(returnValue, buttonHeight)
    }
    
    func testCalculateButtonTopSpacing() {
        //given
        //when
        sut.view.layoutSubviews()
        let returnValue = calculateButtonTopSpacing().rounded()
        let buttonY = button.frame.origin.y.rounded()
        //then
        XCTAssertEqual(returnValue, buttonY)
    }
    
    func testGetMonthInString() {
        //given
        var components = DateComponents()
        components.month = 6
        components.year = 2018
        components.calendar = Calendar.current
        //when
        let date = Calendar.current.date(from: components)
        let stringMonth = date?.month
        //then
        XCTAssertEqual(stringMonth, "June")
    }
    
    func testGetYearInString() {
        //given
        var components = DateComponents()
        components.month = 6
        components.year = 2018
        components.calendar = Calendar.current
        //when
        let date = Calendar.current.date(from: components)
        let stringYear = date?.year
        //then
        XCTAssertEqual(stringYear, "2018")
    }
    
    func testDaysInMonth() {
        //given
        let date = Date()
        let month = 2
        let year = 2019
        //when
        let numberOfDays = date.daysInMonth(month, year)
        //then
        XCTAssertEqual(numberOfDays, 28)
    }
    
    func testGetLastMonthDaysArray() {
        //given
        let vc = CalendarViewController()
        var components = DateComponents()
        components.month = 6
        components.year = 2018
        components.calendar = Calendar.current
        let date = Calendar.current.date(from: components)
        //when
        let daysArray = vc.getLastMonthDaysArray(date).count
        //then
        XCTAssertEqual(daysArray, 31)
    }
    
    func testGetStringDate() {
        //given
        let vc = CalendarViewController()
        var components = DateComponents()
        components.day = 10
        components.month = 6
        components.year = 2018
        components.calendar = Calendar.current
        let date = Calendar.current.date(from: components)
        //when
        let dateInString = vc.getStringDate(date)
        //then
        XCTAssertEqual(dateInString, "2018-06-10")
    }
    
    func testGetDayOfWeekForFirstDayOfMonthFromDateString() {
        //given
        let vc = CalendarViewController()
        var components = DateComponents()
        components.year = 2018
        components.month = 6
        components.calendar = Calendar.current
        let date = Calendar.current.date(from: components)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let stringDate = formatter.string(from: date!)
        //when
        let day = vc.getDayOfWeekForFirstDayOfMonthFromDateString(dateString: stringDate)
        //then
        XCTAssertEqual(day, "Friday")
    }
    
    func testArrayOfLastDaysOfPreviousMonth() {
        //given
        let vc = CalendarViewController()
        var components = DateComponents()
        components.year = 2018
        components.month = 6
        components.calendar = Calendar.current
        let date = Calendar.current.date(from: components)
        //when
        let lastDays = vc.arrayOfLastDaysOfPreviousMonth(date)
        //then
        XCTAssertEqual(lastDays.count, 4)
    }
    
}



