//
//  RegisterUIView.swift
//  ios-cw-app
//
//  Created by Hashan on 2/5/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import UIKit

class RegisterUIView: UIView {
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "Register"
        label.font = UIFont(name: "Acme-Regular", size: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "Full Name"
        label.font = UIFont(name: "Acme-Regular", size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private let nameField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter full name here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Acme-Regular", size: 18)
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "Email Address"
        label.font = UIFont(name: "Acme-Regular", size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter email address here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Acme-Regular", size: 18)
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "Password"
        label.font = UIFont(name: "Acme-Regular", size: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter password here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Acme-Regular", size: 18)
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private let LoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.customGreen
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font =  UIFont(name: "Acme-Regular", size: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(register), for: .touchUpInside)
        return button
    }()
    
    private let loginLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "Already have an account? login"
        label.font = UIFont(name: "Acme-Regular", size: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logo)
        addSubview(titleLabel)
        addSubview(emailLabel)
        addSubview(emailField)
        addSubview(nameLabel)
        addSubview(nameField)
        addSubview(passwordLabel)
        addSubview(passwordField)
        addSubview(LoginButton)
        addSubview(loginLable)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(RegisterUIView.navigateToLogin))
        loginLable.isUserInteractionEnabled = true
        loginLable.addGestureRecognizer(tap)
        
        applyConstraints()
    }
    
    private func applyConstraints(){
        
        let logoConstraints = [
            logo.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            logo.widthAnchor.constraint(equalToConstant: 130),
            logo.heightAnchor.constraint(equalToConstant: 130),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let nameLabelConstraints = [
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let nameFieldConstraints = [
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameField.widthAnchor.constraint(equalTo: widthAnchor, multiplier:  0.8),
            nameField.heightAnchor.constraint(equalToConstant: 50),
            nameField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let emailLabelConstraints = [
            emailLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            emailLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let emailFieldConstraints = [
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailField.widthAnchor.constraint(equalTo: widthAnchor, multiplier:  0.8),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            emailField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let passwordLabelConstraints = [
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            passwordLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let passwordFieldConstraints = [
            passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordField.widthAnchor.constraint(equalTo: widthAnchor, multiplier:  0.8),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let LoginButtonConstraints = [
            LoginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            LoginButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier:  0.8),
            LoginButton.heightAnchor.constraint(equalToConstant: 50),
            LoginButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let loginLableConstraints = [
            loginLable.topAnchor.constraint(equalTo: LoginButton.bottomAnchor, constant: 20),
            loginLable.widthAnchor.constraint(equalTo: widthAnchor, multiplier:  0.8),
            loginLable.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(logoConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(nameFieldConstraints)
        NSLayoutConstraint.activate(emailLabelConstraints)
        NSLayoutConstraint.activate(emailFieldConstraints)
        NSLayoutConstraint.activate(passwordLabelConstraints)
        NSLayoutConstraint.activate(passwordFieldConstraints)
        NSLayoutConstraint.activate(LoginButtonConstraints)
        NSLayoutConstraint.activate(loginLableConstraints)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = bounds
    }
    
    @objc func register(){
        print("Register & navigate to login")
    }
    
    @objc func navigateToLogin(){
        print("Navigate to login screen")
    }
}
