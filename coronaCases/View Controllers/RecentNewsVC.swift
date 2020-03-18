//
//  RecentNewsVC.swift
//  coronaCases
//
//  Created by Andrew Lawler on 16/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

struct tableViewData {
    var country: String
    var state: String
    var confirmed: String
    var deaths: String
    var recovered: String
    var date: String
}

class RecentNewsVC: UIViewController {
    
    let imageStats = UIImageView()
    let infoLabel = UILabel()
    let updatesLabel = UILabel()
    let tableView = UITableView()
    
    var tableViewDataStorage: [tableViewData] = [tableViewData(country: "N.A", state: "N.A", confirmed: "N.A", deaths: "N.A", recovered: "N.A", date: "N.A"), tableViewData(country: "N.A", state: "N.A", confirmed: "N.A", deaths: "N.A", recovered: "N.A", date: "N.A"), tableViewData(country: "N.A", state: "N.A", confirmed: "N.A", deaths: "N.A", recovered: "N.A", date: "N.A"), tableViewData(country: "N.A", state: "N.A", confirmed: "N.A", deaths: "N.A", recovered: "N.A", date: "N.A"), tableViewData(country: "N.A", state: "N.A", confirmed: "N.A", deaths: "N.A", recovered: "N.A", date: "N.A"), tableViewData(country: "N.A", state: "N.A", confirmed: "N.A", deaths: "N.A", recovered: "N.A", date: "N.A"), tableViewData(country: "N.A", state: "N.A", confirmed: "N.A", deaths: "N.A", recovered: "N.A", date: "N.A"), tableViewData(country: "N.A", state: "N.A", confirmed: "N.A", deaths: "N.A", recovered: "N.A", date: "N.A"), tableViewData(country: "N.A", state: "N.A", confirmed: "N.A", deaths: "N.A", recovered: "N.A", date: "N.A"), tableViewData(country: "N.A", state: "N.A", confirmed: "N.A", deaths: "N.A", recovered: "N.A", date: "N.A")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        getSpecificDayStats()
    }
    
    // for this page to work, decode array, then funnel array into for each part into the tableView for the user
    
    func getSpecificDayStats() {
        NetworkManager.shared.getSpecificDay(for: getDate()) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let globalStat):
                DispatchQueue.main.async {
                    self.tableViewDataStorage = [tableViewData(country: globalStat[0].countryRegion ?? "N.A", state: globalStat[0].provinceState ?? "N.A", confirmed: globalStat[0].confirmed ?? "N.A", deaths: globalStat[0].deaths ?? "N.A", recovered: globalStat[0].recovered ?? "N.A", date: globalStat[0].lastUpdate ?? "N.A"), tableViewData(country: globalStat[1].countryRegion ?? "N.A", state: globalStat[1].provinceState ?? "N.A", confirmed: globalStat[1].confirmed ?? "N.A", deaths: globalStat[1].deaths ?? "N.A", recovered: globalStat[1].recovered ?? "N.A", date: globalStat[1].lastUpdate ?? "N.A"), tableViewData(country: globalStat[2].countryRegion ?? "N.A", state: globalStat[2].provinceState ?? "N.A", confirmed: globalStat[2].confirmed ?? "N.A", deaths: globalStat[2].deaths ?? "N.A", recovered: globalStat[2].recovered ?? "N.A", date: globalStat[2].lastUpdate ?? "N.A"), tableViewData(country: globalStat[3].countryRegion ?? "N.A", state: globalStat[3].provinceState ?? "N.A", confirmed: globalStat[3].confirmed ?? "N.A", deaths: globalStat[3].deaths ?? "N.A", recovered: globalStat[3].recovered ?? "N.A", date: globalStat[3].lastUpdate ?? "N.A"), tableViewData(country: globalStat[4].countryRegion ?? "N.A", state: globalStat[4].provinceState ?? "N.A", confirmed: globalStat[4].confirmed ?? "N.A", deaths: globalStat[4].deaths ?? "N.A", recovered: globalStat[4].recovered ?? "N.A", date: globalStat[4].lastUpdate ?? "N.A"), tableViewData(country: globalStat[5].countryRegion ?? "N.A", state: globalStat[5].provinceState ?? "N.A", confirmed: globalStat[5].confirmed ?? "N.A", deaths: globalStat[5].deaths ?? "N.A", recovered: globalStat[5].recovered ?? "N.A", date: globalStat[5].lastUpdate ?? "N.A"), tableViewData(country: globalStat[6].countryRegion ?? "N.A", state: globalStat[6].provinceState ?? "N.A", confirmed: globalStat[6].confirmed ?? "N.A", deaths: globalStat[6].deaths ?? "N.A", recovered: globalStat[6].recovered ?? "N.A", date: globalStat[6].lastUpdate ?? "N.A"), tableViewData(country: globalStat[7].countryRegion ?? "N.A", state: globalStat[7].provinceState ?? "N.A", confirmed: globalStat[7].confirmed ?? "N.A", deaths: globalStat[7].deaths ?? "N.A", recovered: globalStat[7].recovered ?? "N.A", date: globalStat[7].lastUpdate ?? "N.A"), tableViewData(country: globalStat[8].countryRegion ?? "N.A", state: globalStat[8].provinceState ?? "N.A", confirmed: globalStat[8].confirmed ?? "N.A", deaths: globalStat[8].deaths ?? "N.A", recovered: globalStat[8].recovered ?? "N.A", date: globalStat[8].lastUpdate ?? "N.A"), tableViewData(country: globalStat[9].countryRegion ?? "N.A", state: globalStat[9].provinceState ?? "N.A", confirmed: globalStat[9].confirmed ?? "N.A", deaths: globalStat[9].deaths ?? "N.A", recovered: globalStat[9].recovered ?? "N.A", date: globalStat[9].lastUpdate ?? "N.A")]
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                }
            case.failure(let error):
                print(error.rawValue)
            }
        }
        configureUI()
    }
    
    func configureImage() {
        view.addSubview(imageStats)
        
        let imgURL = URL(string: "https://covid19.mathdro.id/api/og")
        imageStats.load(url: imgURL!)
        imageStats.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        view.backgroundColor = .bgBlue
    }
    
    func configureLabels() {
        view.addSubview(infoLabel)
        view.addSubview(updatesLabel)
        
        infoLabel.text = "Here you can find the recent cases followed by the rates."
        infoLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.textColor = .white
        
        updatesLabel.text = "Live Updates"
        updatesLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        updatesLabel.textAlignment = .left
        updatesLabel.numberOfLines = 0
        updatesLabel.translatesAutoresizingMaskIntoConstraints = false
        updatesLabel.textColor = .white
    }
    
    func configureTableView() {
        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.isHidden = true
        tableView.allowsSelection = true
        tableView.rowHeight = 210
        
        tableView.backgroundColor = .bgBlue
        tableView.separatorColor = .white
        tableView.separatorInset = .zero
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CoronaDetailCell.self, forCellReuseIdentifier: "myCell")
    }
    
    func configureUI() {
        configureImage()
        configureNav()
        configureLabels()
        configureTableView()

        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            infoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            infoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            infoLabel.heightAnchor.constraint(equalToConstant: 60),
            
            imageStats.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: padding),
            imageStats.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageStats.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageStats.heightAnchor.constraint(equalToConstant: 200),
            
            updatesLabel.topAnchor.constraint(equalTo: imageStats.bottomAnchor, constant: padding),
            updatesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            updatesLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            updatesLabel.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: updatesLabel.bottomAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getDate() -> String {
        let today = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let result = formatter.string(from: yesterday!)
        return result
    }

}

extension RecentNewsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataStorage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CoronaDetailCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.update(dateUpdated: tableViewDataStorage[indexPath.row].date ?? "N.A", countryName: tableViewDataStorage[indexPath.row].country ?? "N.A", confirmed: tableViewDataStorage[indexPath.row].confirmed ?? "N.A", recovered: tableViewDataStorage[indexPath.row].recovered ?? "N.A", deaths: tableViewDataStorage[indexPath.row].deaths ?? "N.A", province: tableViewDataStorage[indexPath.row].state ?? "N.A")
        return cell
    }
    
    
}
