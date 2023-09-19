//
//  TableViewCell.swift
//  HomeWork3
//
//  Created by Faki Doosuur Doris on 24.09.2023.
//

import UIKit

class OutfitTableViewCell: UITableViewCell {
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        avatarImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayout() {
        guard avatarImageView.superview == nil else { return }
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel,subtitleLabel])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(mainStackView)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
