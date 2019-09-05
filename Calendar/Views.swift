//
//  Views.swift
//  Calendar
//
//  Created by Michał Wziątek on 04/09/2019.
//  Copyright © 2019 Michał Wziątek. All rights reserved.
//

import UIKit

//MARK: - PageViewController UIViews
var pageControl: UIPageControl = {
    let pageControl = UIPageControl()
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    pageControl.numberOfPages = PageViewController().orderedViewControllers.count
    pageControl.currentPage = 0
    pageControl.alpha = 0.5
    pageControl.tintColor = UIColor.black
    pageControl.pageIndicatorTintColor = UIColor.gray
    pageControl.currentPageIndicatorTintColor = UIColor.black
    pageControl.isUserInteractionEnabled = false
    return pageControl
}()

var button: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = #colorLiteral(red: 0.4608529806, green: 0.6918587089, blue: 0.8610083461, alpha: 1)
    button.setTitle("Start", for: .normal)
    
    if UIScreen.main.bounds.height <= 568 {
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 16)
    } else {
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 18)
    }
    button.titleLabel?.minimumScaleFactor = 0.1
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.layer.cornerRadius = calculateButtonHeight()/2
    button.layer.masksToBounds = true
    return button
}()


//MARK: - CalendarViewController UIViews
var monthLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .left
    let date = Date()
    let monthString = date.month
    label.text = monthString
    switch UIScreen.main.bounds.height {
    case 0...568:
        label.font = UIFont(name: "Helvetica Bold", size: 22)
    case 569...750:
        label.font = UIFont(name: "Helvetica Bold", size: 24)
    default:
        label.font = UIFont(name: "Helvetica Bold", size: 28)
    }
    return label
}()

var yearLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .right
    label.alpha = 0.5
    let date = Date()
    let yearString = date.year
    label.text = yearString
    switch UIScreen.main.bounds.height {
    case 0...568:
        label.font = UIFont(name: "Helvetica Bold", size: 22)
    case 569...750:
        label.font = UIFont(name: "Helvetica Bold", size: 24)
    default:
        label.font = UIFont(name: "Helvetica Bold", size: 28)
    }
    return label
}()

var calendarCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = UIColor.white
    collectionView.layer.cornerRadius = 20
    collectionView.clipsToBounds = false
    collectionView.layer.masksToBounds = false
    collectionView.layer.shadowColor = UIColor.black.cgColor
    collectionView.layer.shadowOffset = CGSize(width: 0, height: 3)
    collectionView.layer.shadowRadius = 6
    collectionView.layer.shadowOpacity = 0.16
    
    //        collectionView.layer.shadowPath = UIBezierPath(roundedRect: collectionView.bounds, cornerRadius: 20).cgPath
    
    return collectionView
}()

var calendarButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 58, y: 29, width: 18, height: 18))
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "CalendarIcon"), for: .normal)
    button.alpha = 0.2
    button.tintColor = UIColor.black
    return button
}()

var plusButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "PlusIcon"), for: .normal)
    button.alpha = 0.2
    button.tintColor = UIColor.black
    return button
}()

var menuButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "MenuIcon"), for: .normal)
    button.alpha = 0.2
    button.tintColor = UIColor.black
    return button
}()

var tabBarCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = UIColor.white
    collectionView.layer.cornerRadius = 20
    collectionView.clipsToBounds = false
    collectionView.layer.masksToBounds = false
    collectionView.layer.shadowColor = UIColor.black.cgColor
    collectionView.layer.shadowOffset = .zero
    collectionView.layer.shadowRadius = 6
    collectionView.layer.shadowOpacity = 0.16
    collectionView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    return collectionView
}()

var customTabBar: UIView = {
    let tabBar = UIView()
    tabBar.translatesAutoresizingMaskIntoConstraints = false
    tabBar.backgroundColor = UIColor.white
    tabBar.layer.cornerRadius = 20
    tabBar.layer.shadowColor = UIColor.black.cgColor
    tabBar.layer.shadowOffset = .zero
    tabBar.layer.shadowRadius = 6
    tabBar.layer.shadowOpacity = 0.16
    tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    //        tabBar.layer.shadowPath = UIBezierPath(roundedRect: tabBar.bounds, cornerRadius: 20).cgPath
    return tabBar
}()
