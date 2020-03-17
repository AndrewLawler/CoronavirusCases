//
//  CoronaCell.swift
//  coronaCases
//
//  Created by Andrew Lawler on 15/03/2020.
//  Copyright © 2020 andrewlawler. All rights reserved.
//

import UIKit

class CoronaCell: UITableViewCell {
    
    let icon = UIImageView()
    let type = UILabel()
    
    let normalAttribute = [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Bold", size: 20), NSAttributedString.Key.foregroundColor : UIColor.systemGray]
    let boldAmberAttributes = [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Bold", size: 20), NSAttributedString.Key.foregroundColor : UIColor(displayP3Red: 240/255, green: 208/255, blue: 24/255, alpha: 1)]
    let boldGreenAttributes = [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Bold", size: 20), NSAttributedString.Key.foregroundColor : UIColor.systemGreen]
    let boldRedAttributes = [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Bold", size: 20), NSAttributedString.Key.foregroundColor : UIColor.systemRed]

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
    
    func applyAttributedString(name: String, value: String, label: UILabel) {
        let attributedString: NSMutableAttributedString?
        if name == "Confirmed: " {
            icon.tintColor = UIColor(displayP3Red: 240/255, green: 208/255, blue: 24/255, alpha: 1)
            attributedString = NSMutableAttributedString(string: name, attributes: boldAmberAttributes as [NSAttributedString.Key : Any])
        }
        else if name == "Recovered: " {
            icon.tintColor = .systemGreen
            attributedString = NSMutableAttributedString(string: name, attributes: boldGreenAttributes as [NSAttributedString.Key : Any])
        }
        else {
            icon.tintColor = .systemRed
            attributedString = NSMutableAttributedString(string: name, attributes: boldRedAttributes as [NSAttributedString.Key : Any])
        }
        let valueString = NSMutableAttributedString(string: value, attributes: normalAttribute as [NSAttributedString.Key : Any])
        attributedString!.append(valueString)
        label.attributedText = attributedString!
        
    }
    
    func update(image: String, text: String, cellType: String) {
        applyAttributedString(name: "\(cellType): ", value: text, label: type)
        icon.image = UIImage(systemName: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        type.textColor = UIColor.systemGray
        type.numberOfLines = 0
        type.adjustsFontSizeToFitWidth = true
        type.textAlignment = .left
        type.translatesAutoresizingMaskIntoConstraints = false
        type.font = UIFont(name: "HelveticaNeue", size: 25)
        
        addSubview(type)
        addSubview(icon)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 50),
            icon.heightAnchor.constraint(equalToConstant: 40),
            icon.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            type.centerYAnchor.constraint(equalTo: centerYAnchor),
            type.widthAnchor.constraint(equalToConstant: 300),
            type.heightAnchor.constraint(equalToConstant: 40),
            type.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 20),
        
         
        ])
    }

}

