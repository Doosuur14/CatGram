//
//  TestView.swift
//  TestProject
//
//  Created by Faki Doosuur Doris on 16.02.2024.
//

import UIKit

class TestView: UIView {
    lazy var question: UILabel = UILabel()
    lazy var heartImage: UIImageView = UIImageView()
    lazy var yesButton: UIButton = UIButton()
    lazy var noButton: UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpQuestion()
        setUpImage()
        setUpYesButton()
        setUpNoButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpQuestion() {
        addSubview(question)
        question.text = "Will You Be My valentine?? "
        question.textColor = .black
        question.font = UIFont.boldSystemFont(ofSize: 15)
        question.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            question.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            question.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
        ])
    }

    private func setUpImage() {
       addSubview(heartImage)
       heartImage.contentMode = .scaleAspectFit
       heartImage.isHidden = false
       heartImage.translatesAutoresizingMaskIntoConstraints = false
       heartImage.image = UIImage(named: "teddy one")

        // this animation to make the teddy bear start small then increase to its original size. I insisted on using affinetransform and also animate.
        heartImage.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
           UIView.animate(withDuration: 2.0, animations: {
               self.heartImage.transform = .identity
           })

        NSLayoutConstraint.activate([
            heartImage.topAnchor.constraint(equalTo: question.bottomAnchor, constant: 30),
            heartImage.widthAnchor.constraint(equalToConstant: 200),
            heartImage.heightAnchor.constraint(equalToConstant: 200),
            heartImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100)
        ])
    }

    private func setUpYesButton() {
        addSubview(yesButton)
        yesButton.setTitle("Yes", for: .normal)
        yesButton.setTitleColor(.black, for: .normal)
        yesButton.isEnabled = true
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        yesButton.backgroundColor = .green
        yesButton.layer.cornerRadius = 15
        yesButton.clipsToBounds = true

        NSLayoutConstraint.activate([
            yesButton.bottomAnchor.constraint(equalTo: heartImage.bottomAnchor, constant: 100),
            yesButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            yesButton.widthAnchor.constraint(equalToConstant: 150),
            yesButton.heightAnchor.constraint(equalToConstant: 50)
        ])


    }
    private func setUpNoButton() {
        addSubview(noButton)
        noButton.setTitle("No", for: .normal)
        noButton.setTitleColor(.black, for: .normal)
        noButton.isEnabled = true
        noButton.translatesAutoresizingMaskIntoConstraints = false
        noButton.backgroundColor = .red
        noButton.layer.cornerRadius = 15
        noButton.clipsToBounds = true

        NSLayoutConstraint.activate([
            noButton.bottomAnchor.constraint(equalTo: heartImage.bottomAnchor, constant: 100),
            noButton.leadingAnchor.constraint(equalTo: yesButton.leadingAnchor, constant: 200),
            noButton.widthAnchor.constraint(equalToConstant: 150),
            noButton.heightAnchor.constraint(equalToConstant: 50)
        ])


    }


}
