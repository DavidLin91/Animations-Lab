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
    
    
    private let animationOptions = ["transitionFlipFromLeft", "transitionCurlUp", "transitionFlipFromBottom", "transitionCrossDissovle"]
    
    var animationStyle: String?
    
    let animationDuration = 2
    
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
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
    
    lazy var animationStepperLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Animation Time:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var animationTimeStepper: UIStepper = {
        let animationStepper = UIStepper(frame: CGRect(x: 10, y: 150, width: 0, height: 0))
        animationStepper.wraps = true
        animationStepper.center = self.view.center
        animationStepper.autorepeat = true
        animationStepper.maximumValue = 5
        animationStepper.addTarget(self, action: #selector(animationStepperPressed(sender:)), for: .touchUpInside)
        return animationStepper
    }()
    
    lazy var distanceStepperLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Distance:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var distanceStepper: UIStepper = {
        let animationStepper = UIStepper(frame: CGRect(x: 10, y: 150, width: 0, height: 0))
        animationStepper.wraps = true
        animationStepper.center = self.view.center
        animationStepper.autorepeat = true
        animationStepper.maximumValue = 5
        animationStepper.addTarget(self, action: #selector(distanceStepperPressed(sender:)), for: .touchUpInside)
        return animationStepper
    }()
    
    lazy var animationPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    

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
    
    
    
    override func viewDidLayoutSubviews() {
        upButton.layer.cornerRadius = 8.0
        downButton.layer.cornerRadius = 8.0
        leftButton.layer.cornerRadius = 8.0
        rightButton.layer.cornerRadius = 8.0
    }
    
    
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
        UIView.animate(withDuration: animationTimeStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    
    @IBAction func animationStepperPressed(sender: UIStepper) {
     let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 5
        stepper.stepValue = 1
        stepper.value = 1
    }
    
    
    @IBAction func distanceStepperPressed(sender: UIStepper) {
        
    }
    
    
    private func addSubviews() {
        view.addSubview(blueSquare)
        addStackViewSubviews()
        view.addSubview(buttonStackView)
        view.addSubview(animationTimeStepper)
        view.addSubview(animationStepperLabel)
        view.addSubview(distanceStepperLabel)
        view.addSubview(distanceStepper)
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
        constrainRightButton()
        constrainButtonStackView()
        constraintAnimationStepperLabel()
        constraintAnimationStepper()
        constraintDistanceStepperLabel()
        constraintDistanceStepper()
        
    }
    
    
    private func constrainUpButton() {
        upButton.translatesAutoresizingMaskIntoConstraints = false
        upButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        upButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        upButton.tintColor = .systemTeal
    }
    
    private func constrainDownButton() {
        downButton.translatesAutoresizingMaskIntoConstraints = false
        downButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        downButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        downButton.tintColor = .systemTeal
    }
    
    private func constrainLeftButton() {
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        leftButton.tintColor = .systemTeal
    }
    
    private func constrainRightButton() {
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        rightButton.tintColor = .systemTeal
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
            buttonStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            buttonStackView.heightAnchor.constraint(equalToConstant: 60),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30)
        ])
    }
    
    
    private func constraintAnimationStepperLabel() {
        animationStepperLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationStepperLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 20),
            animationStepperLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            animationStepperLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func constraintAnimationStepper() {
        animationTimeStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationTimeStepper.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            animationTimeStepper.leadingAnchor.constraint(equalTo: animationStepperLabel.trailingAnchor, constant: 20),
            animationTimeStepper.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func constraintDistanceStepperLabel() {
        distanceStepperLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            distanceStepperLabel.topAnchor.constraint(equalTo: animationStepperLabel.bottomAnchor, constant: 10),
            distanceStepperLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            distanceStepperLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func constraintDistanceStepper() {
        distanceStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            distanceStepper.topAnchor.constraint(equalTo: animationTimeStepper.bottomAnchor, constant: 10),
            distanceStepper.leadingAnchor.constraint(equalTo: distanceStepperLabel.trailingAnchor, constant: 84),
            distanceStepper.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animationOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return animationOptions[row]
    }
    
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let transition = animationOptions[row]
            animationStyle = transition
    }
    
}
