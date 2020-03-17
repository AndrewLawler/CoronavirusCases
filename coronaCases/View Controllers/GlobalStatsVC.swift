//
//  GlobalStatsVC.swift
//  coronaCases
//
//  Created by Andrew Lawler on 15/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

class GlobalStatsVC: UIViewController {
    
    let infoLabel = UILabel()
    let worriedLabel = UILabel()
    let lastUpdated = UILabel()
    
    let confirmedCases = RectangleVC(strLabel: "Confirmed", col: UIColor(displayP3Red: 240/255, green: 208/255, blue: 24/255, alpha: 1))
    let recoveredCases = RectangleVC(strLabel: "Recovered", col: UIColor.systemGreen)
    let deathCases = RectangleVC(strLabel: "Deaths", col: UIColor.systemRed)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        getOverallStats()
    }
    
    func getOverallStats() {
        NetworkManager.shared.getOverall() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let globalStat):
                DispatchQueue.main.async {
                    self.confirmedCases.numberLabel.text = String(globalStat.confirmed.value)
                    self.recoveredCases.numberLabel.text = String(globalStat.recovered.value)
                    self.deathCases.numberLabel.text = String(globalStat.deaths.value)
                    self.lastUpdated.text = "Last Updated: \(globalStat.lastUpdate!.prefix(10))"
                    
                }
            case.failure(let error):
                print(error.rawValue)
            }
        }
        configureUI()
    }
    
    func configureUI() {
        configureLabels()
        configureRectangle()
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
        
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            infoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            infoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            infoLabel.heightAnchor.constraint(equalToConstant: 60),
            
            lastUpdated.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: padding),
            lastUpdated.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            lastUpdated.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            lastUpdated.heightAnchor.constraint(equalToConstant: 30),
            
            confirmedCases.view.topAnchor.constraint(equalTo: lastUpdated.bottomAnchor, constant: padding*2),
            confirmedCases.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            confirmedCases.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            confirmedCases.view.heightAnchor.constraint(equalToConstant: 96),
            
            recoveredCases.view.topAnchor.constraint(equalTo: confirmedCases.view.bottomAnchor, constant: padding*2),
            recoveredCases.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            recoveredCases.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            recoveredCases.view.heightAnchor.constraint(equalToConstant: 96),
            
            deathCases.view.topAnchor.constraint(equalTo: recoveredCases.view.bottomAnchor, constant: padding*2),
            deathCases.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            deathCases.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            deathCases.view.heightAnchor.constraint(equalToConstant: 96),
            
            worriedLabel.topAnchor.constraint(equalTo: deathCases.view.bottomAnchor, constant: padding*2),
            worriedLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding*2),
            worriedLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding*2),
            worriedLabel.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
    
    func configureRectangle() {
        confirmedCases.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(confirmedCases)
        view.addSubview(confirmedCases.view)
        confirmedCases.didMove(toParent: self)
        
        recoveredCases.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(recoveredCases)
        view.addSubview(recoveredCases.view)
        recoveredCases.didMove(toParent: self)
        
        deathCases.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(deathCases)
        view.addSubview(deathCases.view)
        deathCases.didMove(toParent: self)
    }
    
    func configureLabels() {
        view.addSubview(infoLabel)
        view.addSubview(lastUpdated)
        view.addSubview(worriedLabel)
        
        infoLabel.text = "These are the global statistics for the virus."
        infoLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.textColor = .systemGray
        
        lastUpdated.text = "Last Updated: "
        lastUpdated.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        lastUpdated.textAlignment = .center
        lastUpdated.numberOfLines = 0
        lastUpdated.translatesAutoresizingMaskIntoConstraints = false
        lastUpdated.textColor = .systemPink
        lastUpdated.adjustsFontSizeToFitWidth = true
        
        worriedLabel.text = "If you are worried about having the virus, please call the NHS on 111 and self isolate for 14 days. "
        worriedLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        worriedLabel.textAlignment = .center
        worriedLabel.numberOfLines = 0
        worriedLabel.translatesAutoresizingMaskIntoConstraints = false
        worriedLabel.textColor = .systemGray
        worriedLabel.adjustsFontSizeToFitWidth = true
    }

}
