//
//  SearchVC.swift
//  coronaCases
//
//  Created by Andrew Lawler on 16/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

struct customRow {
    var imageValue: String
    var textValue: String
}

class SearchVC: UIViewController {

    let countryInput = UITextField()
    let infoLabel = UILabel()
    let countryLabel = UILabel()
    let tableView = UITableView()
    
    var theCountry: Country?
    
    var tableViewRows: [customRow] = [customRow(imageValue: "person.crop.circle.badge.minus", textValue: "Confirmed: N.A"), customRow(imageValue: "person.crop.circle.badge.checkmark", textValue: "Recovered: N.A"), customRow(imageValue: "person.crop.circle.badge.xmark", textValue: "Deaths: N.A")]
    
    let countriesNormal: [String] = ["Afghanistan", "Aland Islands", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bonaire, Saint Eustatius and Saba ", "Bosnia and Herzegovina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos Islands", "Colombia", "Comoros", "Cook Islands", "Costa Rica", "Croatia", "Cuba", "Curacao", "Cyprus", "Czech Republic", "Czechia", "Democratic Republic of the Congo", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard Island and McDonald Islands", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, South", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macao", "Macedonia", "Madagascar", "Mainland China", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "North Korea", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Palestinian Territory", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Republic of the Congo", "Reunion", "Romania", "Russia", "Rwanda", "Saint Barthelemy", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Martin", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Sint Maarten", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard and Jan Mayen", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Taiwan*", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "U.S. Virgin Islands", "US", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican", "Venezuela", "Vietnam", "Wallis and Futuna", "Western Sahara", "Yemen", "Zambia", "Zimbabwe"]
    
    let countriesConverted: [String: String] = ["Afghanistan":"AF","Aland Islands":"AX","Albania":"AL","Algeria":"DZ","American Samoa":"AS","Andorra":"AD","Angola":"AO","Anguilla":"AI","Antarctica":"AQ","Antigua and Barbuda":"AG","Argentina":"AR","Armenia":"AM","Aruba":"AW","Australia":"AU","Austria":"AT","Azerbaijan":"AZ","Bahamas":"BS","Bahrain":"BH","Bangladesh":"BD","Barbados":"BB","Belarus":"BY","Belgium":"BE","Belize":"BZ","Benin":"BJ","Bermuda":"BM","Bhutan":"BT","Bolivia":"BO","Bonaire, Saint Eustatius and Saba ":"BQ","Bosnia and Herzegovina":"BA","Botswana":"BW","Bouvet Island":"BV","Brazil":"BR","British Indian Ocean Territory":"IO","British Virgin Islands":"VG","Brunei":"BN","Bulgaria":"BG","Burkina Faso":"BF","Burundi":"BI","Cambodia":"KH","Cameroon":"CM","Canada":"CA","Cape Verde":"CV","Cayman Islands":"KY","Central African Republic":"CF","Chad":"TD","Chile":"CL","China":"CN","Christmas Island":"CX","Cocos Islands":"CC","Colombia":"CO","Comoros":"KM","Cook Islands":"CK","Costa Rica":"CR","Croatia":"HR","Cuba":"CU","Curacao":"CW","Cyprus":"CY","Czech Republic":"CZ","Czechia":"CZ","Democratic Republic of the Congo":"CD","Denmark":"DK","Djibouti":"DJ","Dominica":"DM","Dominican Republic":"DO","East Timor":"TL","Ecuador":"EC","Egypt":"EG","El Salvador":"SV","Equatorial Guinea":"GQ","Eritrea":"ER","Estonia":"EE","Ethiopia":"ET","Falkland Islands":"FK","Faroe Islands":"FO","Fiji":"FJ","Finland":"FI","France":"FR","French Guiana":"GF","French Polynesia":"PF","French Southern Territories":"TF","Gabon":"GA","Gambia":"GM","Georgia":"GE","Germany":"DE","Ghana":"GH","Gibraltar":"GI","Greece":"GR","Greenland":"GL","Grenada":"GD","Guadeloupe":"GP","Guam":"GU","Guatemala":"GT","Guernsey":"GG","Guinea-Bissau":"GW","Guinea":"GN","Guyana":"GY","Haiti":"HT","Heard Island and McDonald Islands":"HM","Honduras":"HN","Hong Kong":"HK","Hungary":"HU","Iceland":"IS","India":"IN","Indonesia":"ID","Iran":"IR","Iraq":"IQ","Ireland":"IE","Isle of Man":"IM","Israel":"IL","Italy":"IT","Ivory Coast":"CI","Jamaica":"JM","Japan":"JP","Jersey":"JE","Jordan":"JO","Kazakhstan":"KZ","Kenya":"KE","Kiribati":"KI","Korea, South":"KR","Kosovo":"XK","Kuwait":"KW","Kyrgyzstan":"KG","Laos":"LA","Latvia":"LV","Lebanon":"LB","Lesotho":"LS","Liberia":"LR","Libya":"LY","Liechtenstein":"LI","Lithuania":"LT","Luxembourg":"LU","Macao":"MO","Macedonia":"MK","Madagascar":"MG","Mainland China":"CN","Malawi":"MW","Malaysia":"MY","Maldives":"MV","Mali":"ML","Malta":"MT","Marshall Islands":"MH","Martinique":"MQ","Mauritania":"MR","Mauritius":"MU","Mayotte":"YT","Mexico":"MX","Micronesia":"FM","Moldova":"MD","Monaco":"MC","Mongolia":"MN","Montenegro":"ME","Montserrat":"MS","Morocco":"MA","Mozambique":"MZ","Myanmar":"MM","Namibia":"NA","Nauru":"NR","Nepal":"NP","Netherlands":"NL","New Caledonia":"NC","New Zealand":"NZ","Nicaragua":"NI","Niger":"NE","Nigeria":"NG","Niue":"NU","Norfolk Island":"NF","North Korea":"KP","Northern Mariana Islands":"MP","Norway":"NO","Oman":"OM","Pakistan":"PK","Palau":"PW","Palestinian Territory":"PS","Panama":"PA","Papua New Guinea":"PG","Paraguay":"PY","Peru":"PE","Philippines":"PH","Pitcairn":"PN","Poland":"PL","Portugal":"PT","Puerto Rico":"PR","Qatar":"QA","Republic of the Congo":"CG","Reunion":"RE","Romania":"RO","Russia":"RU","Rwanda":"RW","Saint Barthelemy":"BL","Saint Helena":"SH","Saint Kitts and Nevis":"KN","Saint Lucia":"LC","Saint Martin":"MF","Saint Pierre and Miquelon":"PM","Saint Vincent and the Grenadines":"VC","Samoa":"WS","San Marino":"SM","Sao Tome and Principe":"ST","Saudi Arabia":"SA","Senegal":"SN","Serbia":"RS","Seychelles":"SC","Sierra Leone":"SL","Singapore":"SG","Sint Maarten":"SX","Slovakia":"SK","Slovenia":"SI","Solomon Islands":"SB","Somalia":"SO","South Africa":"ZA","South Georgia and the South Sandwich Islands":"GS","South Korea":"KR","South Sudan":"SS","Spain":"ES","Sri Lanka":"LK","Sudan":"SD","Suriname":"SR","Svalbard and Jan Mayen":"SJ","Swaziland":"SZ","Sweden":"SE","Switzerland":"CH","Syria":"SY","Taiwan":"TW","Taiwan*":"TW","Tajikistan":"TJ","Tanzania":"TZ","Thailand":"TH","Togo":"TG","Tokelau":"TK","Tonga":"TO","Trinidad and Tobago":"TT","Tunisia":"TN","Turkey":"TR","Turkmenistan":"TM","Turks and Caicos Islands":"TC","Tuvalu":"TV","U.S. Virgin Islands":"VI","Uganda":"UG","Ukraine":"UA","United Arab Emirates":"AE","United Kingdom":"GB","United States Minor Outlying Islands":"UM","Uruguay":"UY","US":"US","Uzbekistan":"UZ","Vanuatu":"VU","Vatican":"VA","Venezuela":"VE","Vietnam":"VN","Wallis and Futuna":"WF","Western Sahara":"EH","Yemen":"YE","Zambia":"ZM","Zimbabwe":"ZW"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func dismissVC() {
          view.endEditing(true)
          countryLabel.text = countryInput.text
          getCountryStats(country: countriesConverted[countryInput.text!]!)
          tableView.isHidden = false
          tableView.reloadData()
      }
    
    func getCountryStats(country: String) {

        NetworkManager.shared.getCountry(for: country) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let country):
                self.theCountry = country
                DispatchQueue.main.async {
                    self.tableViewRows = [customRow(imageValue: "person.crop.circle.badge.minus", textValue: "Confirmed: \(country.confirmed.value)"), customRow(imageValue: "person.crop.circle.badge.checkmark", textValue: "Recovered: \(country.recovered.value)"), customRow(imageValue: "person.crop.circle.badge.xmark", textValue: "Deaths: \(country.deaths.value)")]
                    self.tableView.isHidden = false
                    self.tableView.reloadData()
                }
            case.failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    func configurePicker() {
        view.addSubview(countryInput)
        
        let countryPicker = UIPickerView()
        countryPicker.delegate = self
        
        countryInput.inputView = countryPicker
        countryInput.translatesAutoresizingMaskIntoConstraints = false
        countryInput.isUserInteractionEnabled = true
        countryInput.placeholder = "Pick a country"
        countryInput.textAlignment = .center
        countryInput.layer.borderWidth = 3
        countryInput.layer.borderColor = UIColor.systemPink.cgColor
        countryInput.layer.cornerRadius = 25
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        countryInput.inputAccessoryView = toolbar
    }
    
    func configureTableView() {
        tableView.isHidden = true
        tableView.reloadData()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = true
        tableView.rowHeight = 70
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CoronaCell.self, forCellReuseIdentifier: "myCell")
    }
    
    func configureLabels() {
        view.addSubview(infoLabel)
        view.addSubview(countryLabel)

        infoLabel.text = "Use the picker below to select a specific country to search."
        infoLabel.font = UIFont(name: "Helvetica", size: 20)
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.textColor = .systemGray
        
        countryLabel.font = UIFont(name: "Helvetica-Bold", size: 50)
        countryLabel.textAlignment = .center
        countryLabel.numberOfLines = 0
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.textColor = .systemPink
        countryLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureUI() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        configureTableView()
        configureLabels()
        configurePicker()

        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
        
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            infoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            infoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            infoLabel.heightAnchor.constraint(equalToConstant: 60),
            
            countryInput.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 40),
            countryInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryInput.heightAnchor.constraint(equalToConstant: 50),
            countryInput.widthAnchor.constraint(equalToConstant: 200),
            
            countryLabel.topAnchor.constraint(equalTo: countryInput.bottomAnchor, constant: 40),
            countryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryLabel.heightAnchor.constraint(equalToConstant: 50),
            countryLabel.widthAnchor.constraint(equalToConstant: 400),
            
            tableView.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 40),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }

}

extension SearchVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countriesNormal.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countriesNormal[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedCountry = countriesConverted[countriesNormal[row]]
        countryInput.text = countriesNormal[row]
        
    }
    
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewRows.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CoronaCell
        cell.update(image: tableViewRows[indexPath.row].imageValue, text: tableViewRows[indexPath.row].textValue)
        return cell
    }
    
}
 
