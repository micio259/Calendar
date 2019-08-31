//
//  ViewController.swift
//  Calendar
//
//  Created by Michał Wziątek on 25/08/2019.
//  Copyright © 2019 Michał Wziątek. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    //MARK: - variables
    let firstViewController = OnboardingViewController(textTitle: "Welcome", description: "Join us and discover all\nof the features we created\nfor you. Just press…")
    let secondViewController = OnboardingViewController(textTitle: "Calendar", description: "Be informed and have perspective\nhow your month is scheduled.\nJust look at Calendar.")
    let thirdViewController = OnboardingViewController(textTitle: "Upcoming set", description: "We provide you being always\nup to date. You won’t miss any\nof tasks you have planned before.")
    let fourthViewController = OnboardingViewController(textTitle: "Join now", description: "Enter the app, experience\nnew possibilities and progress.\nYour time is the most important.")
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [firstViewController, secondViewController, thirdViewController, fourthViewController]
    }()
    
    var pagePageControl = UIPageControl()
    var pageButton = UIButton()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewControllerDelegatesAndFirstScreen(viewControllersArray: orderedViewControllers)
        setupButton(button: pageButton)
        setupPageControl(pageControl: pagePageControl)
        print("Screen height: \(UIScreen.main.bounds.height)")
    }
    
    //MARK: - PageControl Setup
    //TODO: - Tested
    func setupPageControl(pageControl: UIPageControl) {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        pageControl.alpha = 0.5
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.isUserInteractionEnabled = false
        self.view.addSubview(pageControl)
        
        pageControl.topAnchor.constraint(equalTo: self.pageButton.bottomAnchor, constant: calculatePageControlTopSpacing()).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    //MARK: - PageViewController Setups
    //TODO: - Tested
    func setupPageViewControllerDelegatesAndFirstScreen(viewControllersArray: Array<UIViewController>) {
        delegate = self
        dataSource = self
        if let firstViewControllerFromArray = viewControllersArray.first {
            setViewControllers([firstViewControllerFromArray], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //MARK: - Button Setup
    //TODO: - Tested
    func setupButton(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.4608529806, green: 0.6918587089, blue: 0.8610083461, alpha: 1)
        button.setTitle("Start", for: .normal)
        
        if UIScreen.main.bounds.height <= 568 {
            button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 16)
        } else {
            button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 18)
        }
        button.titleLabel?.minimumScaleFactor = 0.1    //or whatever suits your need
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = calculateButtonHeight()/2
        button.layer.masksToBounds = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapButton))
        button.addGestureRecognizer(gestureRecognizer)
        self.view.addSubview(button)

        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: calculateButtonTopSpacing()).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: calculateButtonSideSpacing()).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -calculateButtonSideSpacing()).isActive = true
        button.heightAnchor.constraint(equalToConstant: calculateButtonHeight()).isActive = true
        button.layoutIfNeeded()
    }
    
    
    
    // MARK: - Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pagePageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController)!
        changeButtonTitle()
    }
    
    //MARK: - Datasource functions
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
    
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewControllers.count != nextIndex else {
            return nil
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
        
    }
    
    //MARK: - ButtonTitle func
    //TODO: - Tested
    func changeButtonTitle() {
        if pagePageControl.currentPage == 3 {
            pageButton.setTitle("Enter", for: .normal)
        } else if pagePageControl.currentPage == 0 {
            pageButton.setTitle("Start", for: .normal)
        } else {
            pageButton.setTitle("Next", for: .normal)
        }
    }
    
    //MARK: - Button @OBJC func
    //TODO: - Tested
    @objc func tapButton() {
        
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController ) else { return }
        
        self.view.isUserInteractionEnabled = false
        pagePageControl.currentPage += 1
        
        setViewControllers([nextViewController], direction: .forward, animated: true) { (bool) in
            self.view.isUserInteractionEnabled = true
            self.changeButtonTitle()
        }
        
    }
    
}



