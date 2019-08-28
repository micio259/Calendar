//
//  NewViewController.swift
//  Calendar
//
//  Created by Michał Wziątek on 25/08/2019.
//  Copyright © 2019 Michał Wziątek. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController{
    
    //MARK: - Variables and Constances
    var imageView: UIImageView?
    var textTitle: UILabel?
    var textDescription: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - ViewController Initialization
    init(textTitle: String, description: String) {
        super.init(nibName: nil, bundle: nil)
        setupUI(title: textTitle, description: description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup
    //TODO: - Tested
    func setupUI(title: String, description: String){
        
        self.view.backgroundColor = UIColor.white
        
        //textTitle setup
        textTitle = UILabel(frame: CGRect(x: 0, y: 342, width: UIScreen.main.bounds.width, height: 28))
        textTitle?.text = title
        textTitle?.textAlignment = .center
        textTitle?.font = UIFont(name: "Helvetica Bold", size: 24)
        self.view.addSubview(textTitle!)
        
        //text setup
        textDescription = UILabel(frame: CGRect(x: 69, y: 392, width: 276, height: 65))
        textDescription?.numberOfLines = 3
        textDescription?.text = description
        textDescription?.textAlignment = .center
        textDescription?.font = UIFont(name: "Helvetica Regular", size: 18)
        self.view.addSubview(textDescription!)
        
        //imageView setup
        imageView = UIImageView(frame: CGRect(x: 70, y: 70, width: 274, height: 230))
        imageView?.backgroundColor = UIColor.lightGray
        self.view.addSubview(imageView!)
        
    }
    
}
