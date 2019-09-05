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
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewControllerDelegatesAndFirstScreen(viewControllersArray: orderedViewControllers)
        self.view.addSubview(pageControl)
        self.view.addSubview(button)
        addButtonConstraints()
        addPageControlConstraints()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapButton))
        button.addGestureRecognizer(gestureRecognizer)
    }

    //MARK: - Constraints Functions
    func addPageControlConstraints() {
        pageControl.topAnchor.constraint(equalTo: button.bottomAnchor, constant: calculatePageControlTopSpacing()).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    func setupPageViewControllerDelegatesAndFirstScreen(viewControllersArray: Array<UIViewController>) {
        delegate = self
        dataSource = self
        if let firstViewControllerFromArray = viewControllersArray.first {
            setViewControllers([firstViewControllerFromArray], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func addButtonConstraints() {
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: calculateButtonTopSpacing()).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: calculateButtonSideSpacing()).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -calculateButtonSideSpacing()).isActive = true
        button.heightAnchor.constraint(equalToConstant: calculateButtonHeight()).isActive = true
        button.layoutIfNeeded()
    }
    
    // MARK: - Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController)!
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
        if pageControl.currentPage == 3 {
            button.setTitle("Enter", for: .normal)
        } else if pageControl.currentPage == 0 {
            button.setTitle("Start", for: .normal)
        } else {
            button.setTitle("Next", for: .normal)
        }
    }
    
    //MARK: - Button @OBJC func
    //TODO: - Tested
    @objc func tapButton() {
        if button.titleLabel?.text! == "Enter" {
            let viewController = CalendarViewController()
            present(viewController, animated: true, completion: nil)
        }
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController ) else { return }
        self.view.isUserInteractionEnabled = false
        pageControl.currentPage += 1
        setViewControllers([nextViewController], direction: .forward, animated: true) { (bool) in
            self.view.isUserInteractionEnabled = true
            self.changeButtonTitle()
        }
    }
    
}



