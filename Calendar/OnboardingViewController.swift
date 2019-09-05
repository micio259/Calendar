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
    var onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.lightGray
        return imageView
    }()
    
    var onboardingTextTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica Bold", size: 40)
        label.minimumScaleFactor = 0.1    //or whatever suits your need
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
        return label
    }()
    
    var onboardingTextDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica Regular", size: 24)
        label.minimumScaleFactor = 0.1    //or whatever suits your need
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byClipping
        label.numberOfLines = 3
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(onboardingImageView)
        self.view.addSubview(onboardingTextTitle)
        self.view.addSubview(onboardingTextDescription)
        addOnboardingImageViewConstraints()
        addOnboardingTextTitleConstraints()
        addOnboardingTextDescritionContraints()
        addDimensions()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //MARK: - ViewController Initialization
    init(textTitle: String, description: String) {
        super.init(nibName: nil, bundle: nil)
        onboardingTextTitle.text = textTitle
        onboardingTextDescription.text = description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setup
    func addOnboardingImageViewConstraints() {
        onboardingImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.height * 0.0669642857).isActive = true
        onboardingImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.144927536).isActive = true
        onboardingImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -(self.view.bounds.width * 0.144927536)).isActive = true
        onboardingImageView.layoutIfNeeded()
        let width = onboardingImageView.bounds.width
        onboardingImageView.heightAnchor.constraint(equalToConstant: width * 0.85034014).isActive = true
        self.view.layoutSubviews()
        Dimensions.separatorAspectRatio = onboardingImageView.bounds.height * 0.232
        Dimensions.imageViewHeight = onboardingImageView.bounds.height
    }
    
    func addOnboardingTextTitleConstraints() {
        onboardingTextTitle.topAnchor.constraint(equalTo: onboardingImageView.bottomAnchor, constant: onboardingImageView.bounds.height * 0.125).isActive = true
        onboardingTextTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        onboardingTextTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        onboardingTextTitle.heightAnchor.constraint(equalToConstant: self.view.bounds.width * 0.0676328502).isActive = true
        onboardingTextTitle.layoutIfNeeded()
    }
    
    func addOnboardingTextDescritionContraints() {
        onboardingTextDescription.topAnchor.constraint(equalTo: onboardingTextTitle.bottomAnchor, constant: onboardingImageView.bounds.height * 0.088).isActive = true
        onboardingTextDescription.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.bounds.width * 0.166666667).isActive = true
        onboardingTextDescription.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -(self.view.bounds.width * 0.166666667)).isActive = true
        onboardingTextDescription.heightAnchor.constraint(equalToConstant: onboardingImageView.bounds.height * 0.25).isActive = true
        onboardingTextDescription.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        self.view.layoutSubviews()
    }
    
    func addDimensions() {
        let point = self.view.convert((onboardingTextDescription.frame.origin), to: self.view)
        let rect = self.view.convert(onboardingTextDescription.frame, to: self.view)
        Dimensions.textDescriptionOriginY = point.y
        Dimensions.textDescriptionHeight = rect.height
        Dimensions.separatorAspectRatio = onboardingImageView.bounds.height * 0.232
        Dimensions.imageViewHeight = onboardingImageView.bounds.height
    }
    
}
