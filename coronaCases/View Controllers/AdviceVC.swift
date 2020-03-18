//
//  AdviceVC.swift
//  coronaCases
//
//  Created by Andrew Lawler on 16/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

class AdviceVC: UIViewController {
    
    let infoLabel = UILabel()
    let tipOne = RectangleTipVC(strLabel: "Wash Hands", info: "Wash your hands regularly for 20 seconds with warm water to beat the virus.", severity: .coronaPink)
    let tipTwo = RectangleTipVC(strLabel: "Stay Apart", info: "Distance yourselves by 1 metre from others to stop the spread of the virus.", severity: .coronaGreen)
    let tipThree = RectangleTipVC(strLabel: "Sanitize", info: "Always carry hand sanitizer around to keep yourself clean and safe.", severity: .coronaAmber)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        configureUI()
    }
    
    func configureUI() {

        configureNav()
        configureLabel()
        configureTips()
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
        
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            infoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            infoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            infoLabel.heightAnchor.constraint(equalToConstant: 60),
            
            tipThree.view.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: padding*2),
            tipThree.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            tipThree.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            tipThree.view.heightAnchor.constraint(equalToConstant: 138),
            
            tipTwo.view.topAnchor.constraint(equalTo: tipThree.view.bottomAnchor, constant: padding*2),
            tipTwo.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            tipTwo.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            tipTwo.view.heightAnchor.constraint(equalToConstant: 138),
            
            tipOne.view.topAnchor.constraint(equalTo: tipTwo.view.bottomAnchor, constant: padding*2),
            tipOne.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            tipOne.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            tipOne.view.heightAnchor.constraint(equalToConstant: 138)
            
        ])
        
    }
    
    func configureNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        view.backgroundColor = .bgBlue
    }
    
    func configureLabel() {
        view.addSubview(infoLabel)
        infoLabel.text = "Feel free to use some of these tips to beat the virus and stay safe."
        infoLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.textColor = .white
    }
    
    func configureTips() {
        tipOne.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(tipOne)
        view.addSubview(tipOne.view)
        tipOne.didMove(toParent: self)
        
        tipTwo.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(tipTwo)
        view.addSubview(tipTwo.view)
        tipTwo.didMove(toParent: self)
        
        tipThree.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(tipThree)
        view.addSubview(tipThree.view)
        tipThree.didMove(toParent: self)
    }

}
