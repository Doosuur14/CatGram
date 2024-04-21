//
//  CarTableViewCell.swift
//  ControlworkCorrection
//
//  Created by Faki Doosuur Doris on 17.10.2023.
//

import UIKit

protocol CarCellDelegate: AnyObject {
    func didTapAddButton()
}

class CarTableViewCell: UITableViewCell {
    
    private lazy var carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var addTocartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var addButtonTapped: (() -> Void)?
    
    
    weak var delegate: CarCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews(subviews: carImageView, titleLabel, priceLabel, addTocartButton)
        let addtocartAction = UIAction() {  [weak self] _ in
            self?.addButtonTapped!()
        }
        addTocartButton.addAction(addtocartAction, for: .touchUpInside)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        carImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with car: Car) {
        carImageView.image = car.carImage
        titleLabel.text = car.carModel
        priceLabel.text = car.carPrice + "rub"
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            
            carImageView.widthAnchor.constraint(equalToConstant: 100),
                        carImageView.heightAnchor.constraint(equalToConstant: 100),
                        carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                        carImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                        carImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                        
                        titleLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 10),
                        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                        titleLabel.trailingAnchor.constraint(equalTo: addTocartButton.leadingAnchor, constant: 10),
                        priceLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 10),
                        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                        priceLabel.trailingAnchor.constraint(equalTo: addTocartButton.leadingAnchor, constant: 10),
                        
                        addTocartButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                        addTocartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                        addTocartButton.widthAnchor.constraint(equalToConstant: 25),
                        addTocartButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
    }
}
    
extension CarTableViewCell {
        private func addSubviews(subviews: UIView...) {
            subviews.forEach { contentView.addSubview($0)}
        }
    }
extension UITableViewCell {
    static var reuseidentifier: String {
        return String(describing: self)
    }
}

    
