//
//  ShowCasesVC.swift
//  coronaCases
//
//  Created by Andrew Lawler on 15/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

struct customRow {
    var imageValue:String
    var textValue:String
}

class ShowCasesVC: UIViewController {
    
    let tableView = UITableView()
    let infoLabel = UILabel()
    
    var country: String?
    var theCountry: Country?
    var tableViewRows: [customRow] = [customRow(imageValue: "person.crop.circle.badge.minus", textValue: "Confirmed: N.A"), customRow(imageValue: "person.crop.circle.badge.checkmark", textValue: "Recovered: N.A"), customRow(imageValue: "person.crop.circle.badge.xmark", textValue: "Deaths: N.A")]


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationController?.navigationItem.leftBarButtonItem = doneButton
        view.backgroundColor = .white
        getCountry()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func getCountry() {
        
        // use result cases and either create our table or show failure alert
        
        NetworkManager.shared.getCountry(for: country!){ [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let country):
                self.theCountry = country
                DispatchQueue.main.async {
                    self.infoLabel.text = "Last Update: \(country.lastUpdate!)"
                    self.tableView.reloadData()
                    self.tableViewRows = [customRow(imageValue: "person.crop.circle.badge.minus", textValue: "Confirmed: \(country.confirmed.value)"), customRow(imageValue: "person.crop.circle.badge.checkmark", textValue: "Recovered: \(country.recovered.value)"), customRow(imageValue: "person.crop.circle.badge.xmark", textValue: "Deaths: \(country.deaths.value)")]
                    self.tableView.reloadData()
                }
            case.failure(let error):
                print(error.rawValue)
            }
        }
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(infoLabel)
        configureTableView()
        
        infoLabel.textColor = UIColor.systemGray
        infoLabel.numberOfLines = 0
        infoLabel.adjustsFontSizeToFitWidth = true
        infoLabel.textAlignment = .center
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        
        NSLayoutConstraint.activate([
        
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 300),
            infoLabel.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureTableView() {
        tableView.isHidden = false
        tableView.reloadData()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = true
        tableView.rowHeight = 70
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CoronaCell.self, forCellReuseIdentifier: "myCell")
        tableView.isHidden = false
    }

}

extension ShowCasesVC: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewRows.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CoronaCell
        cell.update(image: tableViewRows[indexPath.row].imageValue, text: tableViewRows[indexPath.row].textValue)
        return cell
    }
        
}

