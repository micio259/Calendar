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
    let firstViewController = OnboardingViewController(textTitle: "Welcome", description: "Join us and discover all of the features we created for you. Just press…")
    let secondViewController = OnboardingViewController(textTitle: "Calendar", description: "Be informed and have perspective how your month is scheduled. Just look at Calendar.")
    let thirdViewController = OnboardingViewController(textTitle: "Upcoming set", description: "We provide you being always up to date. You won’t miss any of tasks you have planned before.")
    let fourthViewController = OnboardingViewController(textTitle: "Join now", description: "Enter the app, experience new possibilities and progress. Your time is the most important.")
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [firstViewController, secondViewController, thirdViewController, fourthViewController]
    }()
    
    var pagePageControl = UIPageControl()
    var pageButton = UIButton()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewControllerDelegatesAndFirstScreen(viewControllersArray: orderedViewControllers)
        setupPageControl(pageControl: pagePageControl)
        buttonSetup(button: pageButton)
    }
    
    //MARK: - PageControl Setup
    //TODO: - Tested
    func setupPageControl(pageControl: UIPageControl) {
        pageControl.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY - 310, width: UIScreen.main.bounds.width, height: 50)
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        pageControl.alpha = 0.5
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.isUserInteractionEnabled = false
        self.view.addSubview(pageControl)
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
    func buttonSetup(button: UIButton) {
        button.frame = CGRect(x: 100, y: 515, width: UIScreen.main.bounds.width - 200, height: 50)
        button.backgroundColor = #colorLiteral(red: 0.4608529806, green: 0.6918587089, blue: 0.8610083461, alpha: 1)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 18)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapButton))
        button.addGestureRecognizer(gestureRecognizer)
        self.view.addSubview(button)
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



