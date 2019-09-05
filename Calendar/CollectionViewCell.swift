//
//  CollectionViewCell.swift
//  Calendar
//
//  Created by Michał Wziątek on 31/08/2019.
//  Copyright © 2019 Michał Wziątek. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        framing()
        framingButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func framing(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica Bold", size: 18)
        addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func framingButton(){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 18)
        addSubview(button)
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -UIScreen.main.bounds.width * 0.132850242).isActive = true
//        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.0434782609).isActive = true
        button.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.0434782609).isActive = true
    }
    
}
