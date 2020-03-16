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
    
    func update(image: String, text: String) {
        icon.image = UIImage(systemName: image)
        type.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = .systemPink
        type.textColor = .systemPink
        
        type.textColor = UIColor.systemGray
        type.numberOfLines = 0
        type.adjustsFontSizeToFitWidth = true
        type.textAlignment = .left
        type.translatesAutoresizingMaskIntoConstraints = false
        type.font = UIFont(name: "Helvetica-Bold", size: 25)
        
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

