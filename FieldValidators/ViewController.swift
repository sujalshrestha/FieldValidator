//
//  ViewController.swift
//  FieldValidators
//
//  Created by Sujal on 11/12/2020.
//

import UIKit

class ViewController: UIViewController {

    let emailField = MyTextField(title: "Enter email", fieldType: .email)
    let passwordField = MyTextField(title: "Enter password", fieldType: .password)
    let phoneField = MyTextField(title: "Enter phone", fieldType: .phone)
    let optionalField = MyTextField(title: "Optional field", fieldType: .normal)
    
    let emailMessage: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let passwordMessage: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.isHidden = true
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let phoneMessage: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var fields = VerticalStackView(arrangedSubViews: [emailField, emailMessage, passwordField, passwordMessage, phoneField, phoneMessage, optionalField], spacing: 10, distribution: .fillProportionally)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        observeEvents()
        
        view.addSubview(fields)
        fields.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 20, bottom: 0, right: 20))
    }

    private func observeEvents() {
        emailField.isValid = { [weak self] (fieldValidMessage) in
            guard let self = self else { return }
            self.emailMessage.text = fieldValidMessage.1 ?? ""
            self.emailMessage.isHidden = fieldValidMessage.0
        }
        
        passwordField.isValid = { [weak self] fieldValidMessage in
            guard let self = self else { return }
            self.passwordMessage.text = fieldValidMessage.1 ?? ""
            self.passwordMessage.isHidden = fieldValidMessage.0
        }
        
        phoneField.isValid = { [weak self] fieldValidMessage in
            guard let self = self else { return }
            self.phoneMessage.text = fieldValidMessage.1 ?? ""
            self.phoneMessage.isHidden = fieldValidMessage.0
        }
        
        optionalField.isValid = { [weak self] fieldValidMessage in
            guard self != nil else { return }
            print("Is Optional Valid: ", fieldValidMessage.0)
            print("Optional Message: ", fieldValidMessage.1 ?? "")
        }
    }
}

