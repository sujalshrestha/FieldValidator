//
//  MyTextField.swift
//  FieldValidators
//
//  Created by Sujal on 11/12/2020.
//

import UIKit

class MyTextField: UITextField {
    
    typealias fieldValidMessage = (Bool, String?)
    
    let fieldType: FieldType
    let validator: FieldValidator
    var isValid: ((fieldValidMessage) -> Void)?
    
    init(title: String, fieldType: FieldType) {
        self.fieldType = fieldType
        validator = FieldValidator(fieldType: self.fieldType)
        super.init(frame: .zero)
        setupUI(title: title)
        observeEvents()
    }
    
    private func setupUI(title: String) {
        placeholder = title
        borderStyle = .roundedRect
        delegate = self
        isSecureTextEntry = fieldType == .password
        if fieldType == .phone { keyboardType = .numberPad }
    }
    
    private func observeEvents() {
        addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
    }
    
    @objc func handleTextChange(_ textField: UITextField) {
        let text                    = textField.text ?? ""
        let minimunLengthValidy     = validator.isMinLength(text: text)
        let maximumLengthValidity   = validator.isMaxLength(text: text)
        let emailValidity           = validator.isEmailValid(text: text)
        let passwordValidity        = validator.isPasswordValid(text: text)
        let isFieldValid            = (minimunLengthValidy && maximumLengthValidity && emailValidity && passwordValidity)
        isValid?((isFieldValid, isFieldValid ? nil : fieldType.validationMessage))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let maxLength = fieldType.maxLength else { return true }
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= maxLength
    }
}
