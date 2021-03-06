//
//  CoronaDetailCell.swift
//  coronaCases
//
//  Created by Andrew Lawler on 16/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

class CoronaDetailCell: UITableViewCell {
    
    let country = UILabel()
    
    let icon1 = UIImageView()
    let icon2 = UIImageView()
    let icon3 = UIImageView()

    let type1 = UILabel()
    let type2 = UILabel()
    let type3 = UILabel()
    
    let normalAttribute = [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Bold", size: 20), NSAttributedString.Key.foregroundColor : UIColor.white]
    let boldAmberAttributes = [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Bold", size: 20), NSAttributedString.Key.foregroundColor : UIColor.coronaAmber]
    let boldGreenAttributes = [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Bold", size: 20), NSAttributedString.Key.foregroundColor : UIColor.coronaGreen]
    let boldRedAttributes = [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Bold", size: 20), NSAttributedString.Key.foregroundColor : UIColor.coronaPink]
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    func update(dateUpdated: String, countryName: String, confirmed: String, recovered: String, deaths: String, province: String) {
        if province != "" {
            country.text = "\(province), \(countryName) (\(dateUpdated.prefix(10)))"
        }
        else {
            country.text = "\(countryName) (\(dateUpdated.prefix(10)))"
        }
        applyAttributedString(name: "Confirmed: ", value: confirmed, label: type1)
        applyAttributedString(name: "Recovered: ", value: recovered, label: type2)
        applyAttributedString(name: "Deaths: ", value: deaths, label: type3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyAttributedString(name: String, value: String, label: UILabel) {
        let attributedString: NSMutableAttributedString?
        if name == "Confirmed: " {
            attributedString = NSMutableAttributedString(string: name, attributes: boldAmberAttributes as [NSAttributedString.Key : Any])
        }
        else if name == "Recovered: " {
            attributedString = NSMutableAttributedString(string: name, attributes: boldGreenAttributes as [NSAttributedString.Key : Any])
        }
        else {
            attributedString = NSMutableAttributedString(string: name, attributes: boldRedAttributes as [NSAttributedString.Key : Any])
        }
        let valueString = NSMutableAttributedString(string: value, attributes: normalAttribute as [NSAttributedString.Key : Any])
        attributedString!.append(valueString)
        label.attributedText = attributedString!
        
    }
    
    private func configure() {

        country.textColor = .white
        country.numberOfLines = 0
        country.adjustsFontSizeToFitWidth = true
        country.textAlignment = .left
        country.translatesAutoresizingMaskIntoConstraints = false
        country.font = UIFont(name: "HelveticaNeue", size: 30)
        
        icon1.translatesAutoresizingMaskIntoConstraints = false
        icon1.tintColor = .coronaAmber
        icon1.image = UIImage(systemName: "person.crop.circle.badge.minus")
    
        
        icon2.translatesAutoresizingMaskIntoConstraints = false
        icon2.tintColor = .coronaGreen
        icon2.image = UIImage(systemName: "person.crop.circle.badge.checkmark")
        
        icon3.translatesAutoresizingMaskIntoConstraints = false
        icon3.tintColor = .coronaPink
        icon3.image = UIImage(systemName: "person.crop.circle.badge.xmark")
        
        type1.textColor = UIColor.systemGray
        type1.numberOfLines = 0
        type1.adjustsFontSizeToFitWidth = true
        type1.textAlignment = .left
        type1.translatesAutoresizingMaskIntoConstraints = false
        
        type2.textColor = UIColor.systemGray
        type2.numberOfLines = 0
        type2.adjustsFontSizeToFitWidth = true
        type2.textAlignment = .left
        type2.translatesAutoresizingMaskIntoConstraints = false
        
        type3.textColor = UIColor.systemGray
        type3.numberOfLines = 0
        type3.adjustsFontSizeToFitWidth = true
        type3.textAlignment = .left
        type3.translatesAutoresizingMaskIntoConstraints = false

        addSubview(country)
        addSubview(icon1)
        addSubview(icon2)
        addSubview(icon3)
        addSubview(type1)
        addSubview(type2)
        addSubview(type3)
        
        let padding: CGFloat = 10
        let sidePadding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            country.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            country.leftAnchor.constraint(equalTo: leftAnchor, constant: sidePadding),
            country.heightAnchor.constraint(equalToConstant: 40),
            country.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            
            icon1.topAnchor.constraint(equalTo: country.bottomAnchor, constant: padding),
            icon1.leftAnchor.constraint(equalTo: leftAnchor, constant: sidePadding),
            icon1.heightAnchor.constraint(equalToConstant: 40),
            icon1.widthAnchor.constraint(equalToConstant: 50),
            
            icon2.topAnchor.constraint(equalTo: icon1.bottomAnchor, constant: padding),
            icon2.leftAnchor.constraint(equalTo: leftAnchor, constant: sidePadding),
            icon2.heightAnchor.constraint(equalToConstant: 40),
            icon2.widthAnchor.constraint(equalToConstant: 50),
            
            icon3.topAnchor.constraint(equalTo: icon2.bottomAnchor, constant: padding),
            icon3.leftAnchor.constraint(equalTo: leftAnchor, constant: sidePadding),
            icon3.heightAnchor.constraint(equalToConstant: 40),
            icon3.widthAnchor.constraint(equalToConstant: 50),
         
            type1.topAnchor.constraint(equalTo: country.bottomAnchor, constant: padding),
            type1.leftAnchor.constraint(equalTo: icon1.rightAnchor, constant: padding),
            type1.heightAnchor.constraint(equalToConstant: 40),
            type1.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            
            type2.topAnchor.constraint(equalTo: icon1.bottomAnchor, constant: padding),
            type2.leftAnchor.constraint(equalTo: icon2.rightAnchor, constant: padding),
            type2.heightAnchor.constraint(equalToConstant: 40),
            type2.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            
            type3.topAnchor.constraint(equalTo: icon2.bottomAnchor, constant: padding),
            type3.leftAnchor.constraint(equalTo: icon3.rightAnchor, constant: padding),
            type3.heightAnchor.constraint(equalToConstant: 40),
            type3.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding)
            
        ])
    }

}

