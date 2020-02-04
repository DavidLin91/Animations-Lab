//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let upButton = UIButton()
    let downButton = UIButton()
    let leftButton = UIButton()
    let rightButton = UIButton()
    
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var buttonStackView: UIStackView = {
       let buttonStack = UIStackView(arrangedSubviews: directionButtons())
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 30
        return buttonStack
    }()
    
    private func directionButtons() -> [UIButton] {
        
        //up button
        upButton.setImage(UIImage(systemName: "arrow.up.circle"), for: .normal)
        upButton.setTitleColor(.white, for: .normal)
        upButton.backgroundColor = .black
        upButton.addTarget(self, action: #selector(animateSquareUp(sender:)), for: .touchUpInside)
        
        // down button
        downButton.setImage(UIImage(systemName: "arrow.down.circle"), for: .normal)
        downButton.setTitleColor(.white, for: .normal)
        downButton.backgroundColor = .black
        downButton.addTarget(self, action: #selector(animateSquareDown(sender:)), for: .touchUpInside)
        
        // left button
        leftButton.setImage(UIImage(systemName: "arrow.left.circle"), for: .normal)
        leftButton.setTitleColor(.white, for: .normal)
        leftButton.backgroundColor = .black
        leftButton.addTarget(self, action: #selector(animateSquareLeft(sender:)), for: .touchUpInside)
        
        // right button
        rightButton.setImage(UIImage(systemName: "arrow.right.circle"), for: .normal)
        rightButton.setTitleColor(.white, for: .normal)
        rightButton.backgroundColor = .black
        rightButton.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
        
        let allDirectionButtons = [upButton, downButton, leftButton, rightButton]
        return allDirectionButtons
    }
    
    

    
    
    
    lazy var blueSquareHeightConstaint: NSLayoutConstraint = {
        blueSquare.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareWidthConstraint: NSLayoutConstraint = {
        blueSquare.widthAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareCenterXConstraint: NSLayoutConstraint = {
        blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var blueSquareCenterYConstraint: NSLayoutConstraint = {
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
    }
    
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffset - 150
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffet + 150
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareLeft(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet - 150
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    
    @IBAction func animateSquareRight(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet + 150
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    
    private func addSubviews() {
        view.addSubview(blueSquare)
        addStackViewSubviews()
        view.addSubview(buttonStackView)
    }
    
    private func addStackViewSubviews() {
        buttonStackView.addSubview(upButton)
        buttonStackView.addSubview(downButton)
        buttonStackView.addSubview(leftButton)
        buttonStackView.addSubview(rightButton)
    }
    
    private func configureConstraints() {
        constrainBlueSquare()
        constrainUpButton()
        constrainDownButton()
        constrainLeftButton()
        constrainButtonStackView()
    }
    
    private func constrainUpButton() {
        upButton.translatesAutoresizingMaskIntoConstraints = false
        upButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        upButton.leadingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
    }
    
    private func constrainDownButton() {
        downButton.translatesAutoresizingMaskIntoConstraints = false
        downButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func constrainLeftButton() {
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func constrainRightButton() {
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    private func constrainBlueSquare() {
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueSquareHeightConstaint,
            blueSquareWidthConstraint,
            blueSquareCenterXConstraint,
            blueSquareCenterYConstraint
        ])
    }
    
    private func constrainButtonStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}


