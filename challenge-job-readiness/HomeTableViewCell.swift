//
//  HomeTableViewCell.swift
//  challenge-job-readiness
//
//  Created by Camila Evelyn Blanc Fick on 13/09/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var onButtonPressed: (() -> Void ) = {}
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onActionButtonPressed), for: .touchUpInside)
        button.backgroundColor = .darkGray
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            //Add button
            contentView.addSubview(button)
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 180).isActive = true
        button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc private func onActionButtonPressed() {
        onButtonPressed()
    }
    
}
