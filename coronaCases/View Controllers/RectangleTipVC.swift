//
//  RectangleTipVC.swift
//  coronaCases
//
//  Created by Andrew Lawler on 16/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

class RectangleTipVC: UIViewController {
    
    let containerView = UIView()
    let titleLabel = UILabel()
    let infoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    init(strLabel: String, info: String){
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = strLabel
        infoLabel.text = info
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.borderColor = UIColor.systemPink.cgColor
        containerView.layer.borderWidth = 3
        containerView.layer.cornerRadius = 15
        view.addSubview(containerView)
        
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .systemPink
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)
        
        infoLabel.font = UIFont(name: "Helvetica", size: 20)
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 0
        infoLabel.textColor = .systemGray
        infoLabel.adjustsFontSizeToFitWidth = true
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 138),
        
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            infoLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            infoLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            infoLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    

}
