//
//  RectangleVC.swift
//  coronaCases
//
//  Created by Andrew Lawler on 16/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

class RectangleVC: UIViewController {
    
    let containerView = UIView()
    let titleLabel = UILabel()
    let numberLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    init(strLabel: String, col: UIColor){
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = strLabel
        titleLabel.textColor = col
        containerView.layer.borderColor = col.cgColor
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .bgBlue
        containerView.layer.borderWidth = 5
        containerView.layer.cornerRadius = 25
        view.addSubview(containerView)
        
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)
        
        numberLabel.text = ""
        numberLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        numberLabel.textAlignment = .center
        numberLabel.textColor = .white
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 100),
        
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            numberLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            numberLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            numberLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            numberLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
    }
    

}
