//
//  HomeTableViewCell.swift
//  challenge-job-readiness
//
//  Created by Camila Evelyn Blanc Fick on 13/09/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let itemId = "thing"
    
    private var thumbnail: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        return view
    }()
    
    var item: Item? {
        didSet{
            itemNameLabel.text = item?.title
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
            if let formattedAmount = formatter.string(for: item?.price) {
                itemPriceLabel.text = formattedAmount
            }
            thumbnail.loadFrom(URLAddress: (item?.secure_thumbnail)!)
        }
    }
    
    private lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var itemPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemNameLabel,itemPriceLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 2
        return stackView
    }()
    
    //    var onButtonPressed: (() -> Void ) = {}
    
    //    lazy var button: UIButton = {
    //        let button = UIButton()
    //        button.setTitle("Button", for: .normal)
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        button.addTarget(self, action: #selector(onActionButtonPressed), for: .touchUpInside)
    //        button.backgroundColor = .darkGray
    //
    //        return button
    //    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Add button
        //            contentView.addSubview(button)
        //        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 180).isActive = true
        //        button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        //        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        setupView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: - Setup View
    private func setupView(){
        addSubview(thumbnail)
        addSubview(stackView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            thumbnail.heightAnchor.constraint(equalToConstant: 131),
            thumbnail.widthAnchor.constraint(equalToConstant: 131),
            thumbnail.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            thumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            thumbnail.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13),
            
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            stackView.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 11),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).self
        ])
    }
    
    //    @objc private func onActionButtonPressed() {
    //        onButtonPressed()
    //    }
    
}
