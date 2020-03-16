//
//  LocalNewsVC.swift
//  coronaCases
//
//  Created by Andrew Lawler on 15/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

class LocalNewsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getSpecificDayStats()
    }
    
    func getSpecificDayStats() {
        NetworkManager.shared.getSpecificDay() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let globalStat):
                DispatchQueue.main.async {
                    print(globalStat.self)
                }
            case.failure(let error):
                print(error.rawValue)
            }
        }
        configureUI()
    }
    
    func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
    }
    
    func getDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let result = formatter.string(from: date)
        return result
    }

}
