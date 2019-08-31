//
//  NewViewController.swift
//  Calendar
//
//  Created by Michał Wziątek on 25/08/2019.
//  Copyright © 2019 Michał Wziątek. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: - Variables and Constances
    var imageView: UIImageView!
    var textTitle: UILabel?
    var textDescription: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
        //view setup
        self.view.backgroundColor = UIColor.white
        //imageView setup
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.lightGray
        self.view.addSubview(imageView!)
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.height * 0.0669642857).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.144927536).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -(self.view.bounds.width * 0.144927536)).isActive = true
        imageView.layoutIfNeeded()
        guard let width = imageView?.bounds.width else { return }
        imageView.heightAnchor.constraint(equalToConstant: width * 0.85034014).isActive = true
        self.view.layoutSubviews()
        
        //textTitle setup
        textTitle = UILabel()
        textTitle?.translatesAutoresizingMaskIntoConstraints = false
        textTitle?.text = title
        textTitle?.textAlignment = .center
        textTitle?.font = UIFont(name: "Helvetica Bold", size: 40)
        textTitle?.minimumScaleFactor = 0.1    //or whatever suits your need
        textTitle?.adjustsFontSizeToFitWidth = true
        textTitle?.lineBreakMode = .byClipping
        textTitle?.numberOfLines = 0
        self.view.addSubview(textTitle!)
        textTitle?.topAnchor.constraint(equalTo: self.imageView!.bottomAnchor, constant: imageView.bounds.height * 0.125).isActive = true
        textTitle?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        textTitle?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        textTitle?.heightAnchor.constraint(equalToConstant: self.view.bounds.width * 0.0676328502).isActive = true
        textTitle?.layoutIfNeeded()

        //text setup
        textDescription = UILabel()
        textDescription?.translatesAutoresizingMaskIntoConstraints = false
//        textDescription?.numberOfLines = 3
        textDescription?.text = description
        textDescription?.textAlignment = .center
        textDescription?.font = UIFont(name: "Helvetica Regular", size: 24)
        textDescription?.minimumScaleFactor = 0.1    //or whatever suits your need
        textDescription?.adjustsFontSizeToFitWidth = true
        textDescription?.lineBreakMode = .byClipping
        textDescription?.numberOfLines = 3
        self.view.addSubview(textDescription!)
        textDescription?.topAnchor.constraint(equalTo: self.textTitle!.bottomAnchor, constant: imageView.bounds.height * 0.088).isActive = true
        textDescription?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.166666667).isActive = true
        textDescription?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -(self.view.bounds.width * 0.166666667)).isActive = true
        textDescription?.heightAnchor.constraint(equalToConstant: imageView.bounds.height * 0.25).isActive = true
        textDescription?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        self.view.layoutSubviews()

        let point = self.view.convert((textDescription?.frame.origin)!, to: self.view)
        let rect = self.view.convert(textDescription!.frame, to: self.view)
        
        Dimensions.textDescriptionOriginY = point.y
        Dimensions.textDescriptionHeight = rect.height
        Dimensions.separatorAspectRatio = imageView.bounds.height * 0.232
        Dimensions.imageViewHeight = imageView.bounds.height
    }
    
}
