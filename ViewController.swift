//
//  ViewController.swift
//  Interactive Animator
//
//  Created by V K on 17.01.2023.
//

import UIKit

class ViewController: UIViewController {

    private var boxView: UIView!
    private var animation: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBox()
        setupAnimation()
    }

    private func setupAnimation() {
        animation = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut) {
            self.boxView.layer.cornerRadius = self.boxView.frame.width / 2
            self.boxView.transform = self.boxView.transform.rotated(by: .pi)
            self.boxView.frame.origin.x = self.view.frame.width - 100
            self.view.backgroundColor = .black
        }
    }
    
    private func setupBox() {
        boxView = UIView(frame: CGRect(x: 5,
                                       y: view.center.y - 100 - 25,
                                       width: 100,
                                       height: 100))
        boxView.backgroundColor = .magenta
        view.addSubview(boxView)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        animation.fractionComplete = CGFloat(sender.value)
    }
}

