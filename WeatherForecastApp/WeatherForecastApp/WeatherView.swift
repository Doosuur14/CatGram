//
//  WeatherView.swift
//  WeatherForecastApp
//
//  Created by Faki Doosuur Doris on 27.02.2024.
//

import UIKit

class WeatherView: UIView {

    lazy var imageView: UIImageView = UIImageView()
    lazy var location: UILabel = UILabel()
    lazy var cityName: UILabel = UILabel()
    lazy var temperature: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpImageView()
        setUpTemperatureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpImageView() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "background image")
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10)
        ])
    }
    private func setUpTemperatureLabel() {
        addSubview(temperature)
        temperature.font = .systemFont(ofSize: 20)
        temperature.text = "Temperature today"
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.textColor = .black
        NSLayoutConstraint.activate([
            temperature.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            temperature.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20)
        ])
    }

   func updateTemp(_ temp: String) {
        temperature.text = temp
    }


}
