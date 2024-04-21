//
//  ViewController.swift
//  TestProject
//
//  Created by Faki Doosuur Doris on 16.02.2024.
//

import UIKit
import SAConfettiView

class ViewController: UIViewController {
    var questionView: TestView?
   // var confettiView: SAConfettiView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        questionView?.yesButton.addTarget(self, action: #selector(setUpConfetti), for: .touchUpInside)
        questionView?.noButton.addTarget(self, action: #selector(setUpBroken), for: .touchUpInside)
    }
    private func setUpView() {
        questionView = TestView(frame: view.bounds)
        view = questionView
        view.backgroundColor = .white
    }


    @objc private func setUpConfetti() {
        let confettiView = SAConfettiView(frame: self.questionView!.bounds)
        self.questionView?.addSubview(confettiView)
        confettiView.startConfetti()
        questionView?.heartImage.image = UIImage(named: "photothree")

        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { _ in
            confettiView.stopConfetti()
            confettiView.removeFromSuperview()
            }
    }


    @objc private func setUpBroken() {
        questionView?.heartImage.image = UIImage(named: "heart broken")
        questionView?.noButton.setTitle("WHY???????", for: .normal)
        view.backgroundColor = .lightGray
    }

}

