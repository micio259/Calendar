//
//  CalendarViewController.swift
//  Calendar
//
//  Created by Michał Wziątek on 31/08/2019.
//  Copyright © 2019 Michał Wziątek. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    //MARK: - Variables and Constances
    let dayArray: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    let gestureRecognizer = UIGestureRecognizer()
    let iconsStringArray = ["CalendarIcon", "ListIcon", "MenuIcon", "PlusIcon"]
    
    //MARK: - Constraint variables
    var monthLabelLeadingConstraint = NSLayoutConstraint()
    var yearLabelTrailingConstraint = NSLayoutConstraint()
    var calendarHeightConstraint = NSLayoutConstraint()
    var calendarTopConstraint = NSLayoutConstraint()


    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        //Set background color
        self.view.backgroundColor = UIColor.white
        
        //Add subviews to self.view
        self.view.addSubview(calendarCollectionView)
        self.view.addSubview(tabBarCollectionView)
//        self.view.addSubview(customTabBar)
        self.view.addSubview(monthLabel)
        self.view.addSubview(yearLabel)

        //Add constraints
        addMonthLabelConstraints()
        addYearLabelConstraints()
        addTabBarCollectionViewConstraits()
//        addTabBarConstraits()
        addCalendarCollectionViewConstraints()
        
        //Set collectionView delegate and dataSource
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self
        
        //Register collectionViewCell
        calendarCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        tabBarCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    //MARK: - Constraints Functions
    func addMonthLabelConstraints() {
        monthLabelLeadingConstraint = monthLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.0652173913)
        monthLabelLeadingConstraint.isActive = true
        monthLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.207729469).isActive = true
    }
    
    func addYearLabelConstraints() {
        yearLabelTrailingConstraint = yearLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.0652173913)
        yearLabelTrailingConstraint.isActive = true
        yearLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.207729469).isActive = true
    }
    
    func addTabBarConstraits() {
        customTabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        customTabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        customTabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        customTabBar.heightAnchor.constraint(equalToConstant: self.view.bounds.width * 0.236714976).isActive = true
        customTabBar.layoutIfNeeded()
    }
    
    func addTabBarCollectionViewConstraits() {
        tabBarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tabBarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        tabBarCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tabBarCollectionView.heightAnchor.constraint(equalToConstant: self.view.bounds.width * 0.236714976).isActive = true
//        tabBarCollectionView.layoutIfNeeded()
    }
    
    func addCalendarCollectionViewConstraints() {
        
        switch getDayOfWeekForFirstDayOfMonthFromDateString(dateString: getStringDate()) {
        case "Monday":
            calendarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.362318841).isActive = true
            calendarCollectionView.layoutIfNeeded()
            calendarCollectionView.heightAnchor.constraint(equalToConstant: calendarCollectionView.bounds.width * 0.858333333).isActive = true

        case "Tuesday":
            calendarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.362318841).isActive = true
            calendarCollectionView.layoutIfNeeded()
            calendarCollectionView.heightAnchor.constraint(equalToConstant: calendarCollectionView.bounds.width * 0.858333333).isActive = true

        case "Wednesday":
            calendarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.362318841).isActive = true
            calendarCollectionView.layoutIfNeeded()
            calendarCollectionView.heightAnchor.constraint(equalToConstant: calendarCollectionView.bounds.width * 0.858333333).isActive = true

        case "Thursday":
            calendarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.362318841).isActive = true
            calendarCollectionView.layoutIfNeeded()
            calendarCollectionView.heightAnchor.constraint(equalToConstant: calendarCollectionView.bounds.width * 0.858333333).isActive = true

        case "Friday":
            calendarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.362318841).isActive = true
            calendarCollectionView.layoutIfNeeded()
            calendarCollectionView.heightAnchor.constraint(equalToConstant: calendarCollectionView.bounds.width * 0.858333333).isActive = true

        case "Saturday":
            if Date().daysInMonth() == 30 {
                calendarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.0652173913).isActive = true
                calendarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.0652173913).isActive = true
                calendarCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.362318841).isActive = true
                calendarCollectionView.layoutIfNeeded()
                calendarCollectionView.heightAnchor.constraint(equalToConstant: calendarCollectionView.bounds.width * 0.858333333).isActive = true
            } else {
                calendarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.0652173913).isActive = true
                calendarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.0652173913).isActive = true
                calendarCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.362318841).isActive = true
                calendarCollectionView.layoutIfNeeded()
                calendarCollectionView.heightAnchor.constraint(equalToConstant: calendarCollectionView.bounds.width * 0.92).isActive = true
            }
            
        case "Sunday":
            calendarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.0652173913).isActive = true
            calendarTopConstraint = calendarCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.362318841)
            calendarTopConstraint.isActive = true
            calendarHeightConstraint = calendarCollectionView.heightAnchor.constraint(equalToConstant: self.view.bounds.width * 0.821256039)
            calendarHeightConstraint.isActive = true

        default:
            calendarCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.0652173913).isActive = true
            calendarCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.width * 0.362318841).isActive = true
            calendarCollectionView.layoutIfNeeded()
            calendarCollectionView.heightAnchor.constraint(equalToConstant: calendarCollectionView.bounds.width * 0.858333333).isActive = true
        }
    }
    
    func addCalendarButtonConstraints() {
        calendarButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.140096618).isActive = true
        calendarButton.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: customTabBar.bounds.height * 0.285714286).isActive = true
        calendarButton.heightAnchor.constraint(equalToConstant: self.view.bounds.width * 0.0434782609).isActive = true
        calendarButton.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.0434782609).isActive = true
    }
    
    func addPlusButtonConstraints() {
        plusButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        plusButton.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: customTabBar.bounds.height * 0.285714286).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: self.view.bounds.width * 0.0434782609).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.0434782609).isActive = true
    }
    
    func addMenuButtonConstraints() {
        menuButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -self.view.bounds.width * 0.140096618).isActive = true
        menuButton.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: customTabBar.bounds.height * 0.285714286).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: self.view.bounds.width * 0.0434782609).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.0434782609).isActive = true
        menuButton.layoutIfNeeded()
    }
    
    
    //MARK: - Date to String Functions
    //tested
    func getStringDate(_ date: Date? = nil) -> String {
        if let date = date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let stringDate = formatter.string(from: date)
            return stringDate
        } else {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let stringDate = formatter.string(from: date)
            return stringDate
        }
    }
    
    //tested
    func getDayOfWeekForFirstDayOfMonthFromDateString(dateString:String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: dateString) {
            if let firstOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: date)) {
                formatter.dateFormat = "EEEE"
                return formatter.string(from: firstOfMonth)
            }
        }
        return nil
    }
    
    //tested
    func getLastMonthDaysArray(_ date: Date? = nil) -> Array<Int> {
        if let date = date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let lastMonthDate = Calendar.current.date(byAdding: .month, value: -1, to: date)
            let currentYearDate = Calendar.current.date(byAdding: .year, value: 0, to: date)
            let calendar = Calendar.current
            let lastMonthNumber = calendar.component(.month, from:lastMonthDate!)
            let currentYearNumber = calendar.component(.year, from: currentYearDate!)
            let numberOfDays = date.daysInMonth(lastMonthNumber, currentYearNumber)
            let array = Array(1...numberOfDays)
            return array
        } else {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let calendar = Calendar.current
            let lastMonthDate = Calendar.current.date(byAdding: .month, value: -1, to: date)
            let currentYearDate = Calendar.current.date(byAdding: .year, value: 0, to: date)
            let lastMonthNumber = calendar.component(.month, from:lastMonthDate!)
            let currentYearNumber = calendar.component(.year, from: currentYearDate!)
            let numberOfDays = date.daysInMonth(lastMonthNumber, currentYearNumber)
            let array = Array(1...numberOfDays)
            return array
        }
    }
    
    //MARK: - Array of Days Function
    //tested
    func arrayOfLastDaysOfPreviousMonth(_ date: Date? = nil) -> [Int] {
        
        if let date = date {
            
            var array = getLastMonthDaysArray(date)
            let stringDate = getStringDate(date)
            
            switch getDayOfWeekForFirstDayOfMonthFromDateString(dateString: stringDate) {
            case "Monday":
                let range = array.count
                array.removeSubrange(0..<range)
                return array
            case "Tuesday":
                let range = array.count - 1
                array.removeSubrange(0..<range)
                return array
            case "Wednesday":
                let range = array.count - 2
                array.removeSubrange(0..<range)
                return array
            case "Thursday":
                let range = array.count - 3
                array.removeSubrange(0..<range)
                return array
            case "Friday":
                let range = array.count - 4
                array.removeSubrange(0..<range)
                return array
            case "Saturday":
                let range = array.count - 5
                array.removeSubrange(0..<range)
                return array
            case "Sunday":
                let range = array.count - 3
                array.removeSubrange(0..<range)
                return array
            default:
                let range = array.count
                array.removeSubrange(0..<range)
                return array
            }
            
        } else {
            
            let stringDate = getStringDate()
            var array = getLastMonthDaysArray()
            
            switch getDayOfWeekForFirstDayOfMonthFromDateString(dateString: stringDate) {
            case "Monday":
                let range = array.count
                array.removeSubrange(0..<range)
                return array
            case "Tuesday":
                let range = array.count - 1
                array.removeSubrange(0..<range)
                return array
            case "Wednesday":
                let range = array.count - 2
                array.removeSubrange(0..<range)
                return array
            case "Thursday":
                let range = array.count - 3
                array.removeSubrange(0..<range)
                return array
            case "Friday":
                let range = array.count - 4
                array.removeSubrange(0..<range)
                return array
            case "Saturday":
                let range = array.count - 5
                array.removeSubrange(0..<range)
                return array
            case "Sunday":
                let range = array.count - 6
                array.removeSubrange(0..<range)
                return array
            default:
                let range = array.count
                array.removeSubrange(0..<range)
                return array
            }
        }
    }

}

//MARK: - CollectionView delegate and datasource methods
extension CalendarViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == tabBarCollectionView {
            return iconsStringArray.count
        } else {

            let date = Date()
            let stringDate = getStringDate()

            switch getDayOfWeekForFirstDayOfMonthFromDateString(dateString: stringDate) {
            case "Monday":
                if date.daysInMonth() == 30 {
                    return Date().daysInMonth() + 7 + 5
                } else {
                    return Date().daysInMonth() + 7 + 4
                }
            case "Tuesday":
                if date.daysInMonth() == 30 {
                    return Date().daysInMonth() + 8 + 4
                } else {
                    return Date().daysInMonth() + 8 + 3
                }
            case "Wednesday":
                if date.daysInMonth() == 30 {
                    return Date().daysInMonth() + 9 + 3
                } else {
                    return Date().daysInMonth() + 9 + 2
                }
            case "Thursday":
                if date.daysInMonth() == 30 {
                    return Date().daysInMonth() + 10 + 2
                } else {
                    return Date().daysInMonth() + 10 + 1
                }
            case "Friday":
                if date.daysInMonth() == 30 {
                    return Date().daysInMonth() + 11 + 1
                } else {
                    return Date().daysInMonth() + 11
                }
            case "Saturday":
                if date.daysInMonth() == 30 {
                    return Date().daysInMonth() + 12
                } else {
                    return Date().daysInMonth() + 12 + 6
                }
            case "Sunday":
                if date.daysInMonth() == 30 {
                    return Date().daysInMonth() + 13 + 6
                } else {
                    return Date().daysInMonth() + 13 + 5
                }
            default:
                return Date().daysInMonth() + 7
            }

        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let dayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        if collectionView == tabBarCollectionView {
            switch indexPath.item {
            case 0:
                cell.button.setImage(UIImage(named: iconsStringArray[indexPath.item]), for: .normal)
                cell.alpha = 1
                cell.backgroundColor = UIColor.clear
                return cell
            default:
                cell.button.setImage(UIImage(named: iconsStringArray[indexPath.item]), for: .normal)
                cell.alpha = 0.5
                cell.backgroundColor = UIColor.clear
                return cell
            }
        } else {
        
        switch UIScreen.main.bounds.height {
        case 0...568:
            if indexPath.item <= 6 {
                dayCell.label.font = UIFont(name: "Helvetica Bold", size: 12)
            } else {
                cell.label.font = UIFont(name: "Helvetica Bold", size: 14)
            }
        case 569...750:
            if indexPath.item <= 6 {
                dayCell.label.font = UIFont(name: "Helvetica Bold", size: 14)
            } else {
                cell.label.font = UIFont(name: "Helvetica Bold", size: 16)
            }
        default:
            if indexPath.item <= 6 {
                dayCell.label.font = UIFont(name: "Helvetica Bold", size: 16)
            } else {
                cell.label.font = UIFont(name: "Helvetica Bold", size: 18)
            }
        }
        
        let daysArray = Array(1...6)
        
        let date = Date()
        let numberOfDays = date.daysInMonth()
        let stringDate = getStringDate()
        
        switch getDayOfWeekForFirstDayOfMonthFromDateString(dateString: stringDate) {
        case "Monday":
            if indexPath.item <= 6 {
                dayCell.label.text = dayArray[indexPath.item]
                dayCell.backgroundColor = UIColor.clear
                return dayCell
            } else if indexPath.item <= numberOfDays + 6 {
                cell.label.text = "\(indexPath.row - 6)"
                cell.backgroundColor = UIColor.clear
                return cell
            } else {
                cell.label.text = "\(daysArray[indexPath.item - (numberOfDays + 6 + 1)])"
                cell.backgroundColor = UIColor.clear
                cell.label.alpha = 0.2
                return cell
            }
        case "Tuesday":
            if indexPath.item <= 6 {
                dayCell.label.text = dayArray[indexPath.item]
                dayCell.backgroundColor = UIColor.clear
                return dayCell
            }
            else if indexPath.item == 7 {
                cell.label.text = "\(arrayOfLastDaysOfPreviousMonth()[indexPath.item - 7])"
                cell.label.alpha = 0.2
                cell.backgroundColor = UIColor.clear
                return cell
            } else if indexPath.item <= numberOfDays + 7 {
                cell.label.text = "\(indexPath.row - 7)"
                cell.backgroundColor = UIColor.clear
                return cell
            } else {
                cell.label.text = "\(daysArray[indexPath.item - (numberOfDays + 7 + 1)])"
                cell.backgroundColor = UIColor.clear
                cell.label.alpha = 0.2
                return cell
            }

        case "Wednesday":
            
            if indexPath.item <= 6 {
                dayCell.label.text = dayArray[indexPath.item]
                dayCell.backgroundColor = UIColor.clear
                return dayCell
            }
            else if indexPath.item <= 8 {
                cell.label.text = "\(arrayOfLastDaysOfPreviousMonth()[indexPath.item - 7])"
                cell.label.alpha = 0.2
                cell.backgroundColor = UIColor.clear
                return cell
            } else if indexPath.item <= numberOfDays + 8 {
                cell.label.text = "\(indexPath.row - 8)"
                cell.backgroundColor = UIColor.clear
                return cell
            } else {
                cell.label.text = "\(daysArray[indexPath.item - (numberOfDays + 8 + 1)])"
                cell.backgroundColor = UIColor.clear
                cell.label.alpha = 0.2
                return cell
            }

        case "Thursday":
            if indexPath.item <= 6 {
                dayCell.label.text = dayArray[indexPath.item]
                dayCell.backgroundColor = UIColor.clear
                return dayCell
            }
            else if indexPath.item <= 9 {
                cell.label.text = "\(arrayOfLastDaysOfPreviousMonth()[indexPath.item - 7])"
                cell.label.alpha = 0.2
                cell.backgroundColor = UIColor.clear
                return cell
            } else if indexPath.item <= numberOfDays + 9 {
                cell.label.text = "\(indexPath.row - 9)"
                cell.backgroundColor = UIColor.clear
                return cell
            } else {
                cell.label.text = "\(daysArray[indexPath.item - (numberOfDays + 9 + 1)])"
                cell.backgroundColor = UIColor.clear
                cell.label.alpha = 0.2
                return cell
            }

        case "Friday":
            if indexPath.item <= 6 {
                dayCell.label.text = dayArray[indexPath.item]
                dayCell.backgroundColor = UIColor.clear
                return dayCell
            }
            else if indexPath.item <= 10 {
                cell.label.text = "\(arrayOfLastDaysOfPreviousMonth()[indexPath.item - 7])"
                cell.label.alpha = 0.2
                cell.backgroundColor = UIColor.clear
                return cell
            } else if indexPath.item <= numberOfDays + 10 {
                cell.label.text = "\(indexPath.row - 10)"
                cell.backgroundColor = UIColor.clear
                return cell
            } else {
                cell.label.text = "\(daysArray[indexPath.item - (numberOfDays + 10 + 1)])"
                cell.backgroundColor = UIColor.clear
                cell.label.alpha = 0.2
                return cell
            }

        case "Saturday":
            if indexPath.item <= 6 {
                dayCell.label.text = dayArray[indexPath.item]
                dayCell.backgroundColor = UIColor.clear
                return dayCell
            }
            else if indexPath.item <= 11 {
                cell.label.text = "\(arrayOfLastDaysOfPreviousMonth()[indexPath.item - 7])"
                cell.label.alpha = 0.2
                cell.backgroundColor = UIColor.clear
                return cell
            } else if indexPath.item <= numberOfDays + 11 {
                cell.label.text = "\(indexPath.row - 11)"
                cell.backgroundColor = UIColor.clear
                return cell
            } else {
                cell.label.text = "\(daysArray[indexPath.item - (numberOfDays + 11 + 1)])"
                cell.backgroundColor = UIColor.clear
                cell.label.alpha = 0.2
                return cell
            }

        case "Sunday":
            if indexPath.item <= 6 {
                dayCell.label.text = dayArray[indexPath.item]
                dayCell.backgroundColor = UIColor.clear
                dayCell.label.alpha = 0.5
                return dayCell
            } else if indexPath.item <= 12 {
                cell.label.text = "\(arrayOfLastDaysOfPreviousMonth()[indexPath.item - 7])"
                cell.label.alpha = 0.2
                return cell
            } else if indexPath.item <= numberOfDays + 12 {
                cell.label.alpha = 0.5
                cell.label.text = "\(indexPath.row - 12)"
                cell.backgroundColor = UIColor.clear
                return cell
            } else {
                cell.label.text = "\(daysArray[indexPath.item - (numberOfDays + 12 + 1)])"
                cell.backgroundColor = UIColor.clear
                cell.label.alpha = 0.2
                return cell
            }

        default:
            if indexPath.item <= 6 {
                dayCell.label.text = dayArray[indexPath.item]
                dayCell.backgroundColor = UIColor.clear
                return dayCell
            } else {
                cell.label.text = "\(indexPath.row - 6)"
                cell.backgroundColor = UIColor.clear
                return cell
            }
        }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == tabBarCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
        return UIEdgeInsets(top: calendarCollectionView.bounds.width * 0.0527777778, left: calendarCollectionView.bounds.width * 0.0527777778, bottom: 0, right: calendarCollectionView.bounds.width * 0.0527777778)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let arrayCount = CGFloat(iconsStringArray.count)
        
        if collectionView == tabBarCollectionView {
            return CGSize(width: self.view.bounds.width/arrayCount, height: self.view.bounds.width * 0.2361496)
        } else {
        return CGSize(width: calendarCollectionView.bounds.width * 0.113888889, height: calendarCollectionView.bounds.width * 0.113888889)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == tabBarCollectionView {
            
            let cells = collectionView.visibleCells
            for cell in cells {
                if collectionView.indexPath(for: cell) == indexPath {
                    cell.alpha = 1
                } else {
                cell.alpha = 0.5
                }
            }
//            let cell = tabBarCollectionView.cellForItem(at: indexPath) as! CollectionViewCell
//            cell.alpha = 1
            
                    switch indexPath.item {
                    case 0:
                        calendarCollectionView.isUserInteractionEnabled = false
                        calendarHeightConstraint.constant = self.view.bounds.width * 0.821256039
                        calendarTopConstraint.constant = self.view.bounds.width * 0.362318841
                        UIView.animate(withDuration: 0.25, animations: {
                            self.view.layoutIfNeeded()
                        }) { (ended) in
                            self.monthLabelLeadingConstraint.constant = self.view.bounds.width * 0.0652173913
                            self.yearLabelTrailingConstraint.constant = -self.view.bounds.width * 0.0652173913
                            UIView.animate(withDuration: 0.25, animations: {
                                self.view.layoutIfNeeded()
                            })
                            calendarCollectionView.dataSource = self
                            calendarCollectionView.reloadData()
                            calendarCollectionView.isUserInteractionEnabled = true
                        }
                    case 1:
//                        let cellOne = tabBarCollectionView.cellForItem(at: [0, 0]) as! CollectionViewCell
//                        cellOne.button.alpha = 0.5
//                        let cellTwo = tabBarCollectionView.cellForItem(at: indexPath) as! CollectionViewCell
//                        cellTwo.button.alpha = 1
                        calendarCollectionView.isUserInteractionEnabled = false
                        calendarCollectionView.dataSource = nil
                        calendarCollectionView.reloadData()
                        monthLabelLeadingConstraint.constant = self.view.bounds.width * 0.137681159
                        yearLabelTrailingConstraint.constant = -self.view.bounds.width * 0.137681159
                        UIView.animate(withDuration: 0.25, animations: {
                            self.view.layoutIfNeeded()
                        }) { (ended) in
                            self.calendarHeightConstraint.constant = self.view.bounds.width * 0.265700483
                            self.calendarTopConstraint.constant = self.view.bounds.width * 0.115942029
                            UIView.animate(withDuration: 0.25, animations: {
                                self.view.layoutIfNeeded()
                            })
                            calendarCollectionView.isUserInteractionEnabled = true
                        }
                    case 2:
                        print("3")
                    default:
                        print("Default")
                    }
            
        } else {
            
        }
        
    }
    
    
}

//MARK: - Date extension variables and functions
extension Date {
    
    //tested
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    //tested
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
    
    //tested
    func daysInMonth(_ monthNumber: Int? = nil, _ year: Int? = nil) -> Int {
        var dateComponents = DateComponents()
        dateComponents.year = year ?? Calendar.current.component(.year,  from: self)
        dateComponents.month = monthNumber ?? Calendar.current.component(.month,  from: self)
        if let date = Calendar.current.date(from: dateComponents),
           let interval = Calendar.current.dateInterval(of: .month, for: date),
           let days = Calendar.current.dateComponents([.day], from: interval.start, to: interval.end).day {
            return days
        } else {
            return -1
        }
    }
    
}
