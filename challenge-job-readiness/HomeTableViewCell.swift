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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onActionButtonPressed), for: .touchUpInside)
        
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // ubicar el boton
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func onActionButtonPressed() {
        onButtonPressed()
    }

}
