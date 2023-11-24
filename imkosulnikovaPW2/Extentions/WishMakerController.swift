//
//  WishMakerController2.swift
//  imkosulnikovaPW2
//
//  Created by Inna Kosulnikova on 24.11.2023.
//


import UIKit

final class WishMakerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureUI()
    }
    
    let heading = UILabel()
    
    private let addWishButton: UIButton = UIButton(type: .system)
    
    enum Constants {
        static let colorRangeMax = 255
        static let colorRangeMin = 0
        
        static let buttonHeight: Double = 64
        static let buttonBottom: Double = 60
        static let buttonSide: Double = 20
        static let buttonText: String = "Press the button"
        static let buttonRadius: CGFloat = 18
        
        
    }
    
    
    private func configureUI() {
        view.backgroundColor = .black
        
        configureTitle()
        configureDescription()
        configureAddWishButton()
        configureSliders()
    }
    
    private func configureTitle() {
        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.text = " Hi, it is WishMaker"
        heading.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold)
        heading.textColor = .white
        heading.backgroundColor = .systemCyan
        
        view.addSubview(heading)
        NSLayoutConstraint.activate([
            heading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    private func configureDescription() {
        let description = UILabel() // make it a private field titleView above viewDidLoad()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "Very informative description"
        description.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
        description.textColor = .white
        
        view.addSubview(description)
        NSLayoutConstraint.activate([
            description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            description.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            description.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 20)
        ])
    }
    
    private func updateColor(sliderRed: CustomSlider, sliderGreen: CustomSlider, sliderBlue: CustomSlider) {
        let newColor = UIColor(
            red: CGFloat(sliderRed.slider.value / Float(Constants.colorRangeMax)),
            green: CGFloat(sliderGreen.slider.value / Float(Constants.colorRangeMax)),
            blue: CGFloat(sliderBlue.slider.value / Float(Constants.colorRangeMax)),
            alpha: CGFloat(1.0)
        )
        self.view.backgroundColor = newColor
    }
    
    private func configureAddWishButton() {
        view.addSubview(addWishButton)
        addWishButton.setHeight(Constants.buttonHeight)
        addWishButton.pinBottom(to: view, Constants.buttonBottom)
        addWishButton.pinHorizontal(to: view, Constants.buttonSide)
        
        addWishButton.backgroundColor = .white
        addWishButton.setTitleColor(.systemPink, for: .normal)
        addWishButton.setTitle(Constants.buttonText, for: .normal)
        
        addWishButton.layer.cornerRadius = Constants.buttonRadius
        addWishButton.addTarget(self, action: #selector(addWishButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func addWishButtonPressed() {
        present(WishStoringViewController(), animated: true)
    }
    
    private func configureSliders() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = 20
        stack.clipsToBounds = true
        
        let sliderRed = CustomSlider(title: "Red as in rose", min: Double(Constants.colorRangeMin), max: Double(Constants.colorRangeMax))
        let sliderBlue = CustomSlider(title: "Blue as in sky", min: Double(Constants.colorRangeMin), max: Double(Constants.colorRangeMax))
        let sliderGreen = CustomSlider(title: "Green as in grass", min: 0, max: Double(Constants.colorRangeMax))
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
        }
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.pinBottom(to: addWishButton.topAnchor, Constants.buttonSide)
        ])
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            slider.valueChanged = { [weak self] value in
                self?.updateColor(sliderRed: sliderRed, sliderGreen: sliderGreen, sliderBlue: sliderBlue)
            }
        }
    }
    
    
}
