//
//  MyTextField.swift
//  FieldValidators
//
//  Created by Sujal on 11/12/2020.
//

import Foundation

enum FieldType {
    case email
    case password
    case phone
    case normal
    
    var minLength: Int? {
        switch self {
        case .email, .password: return 8
        case .phone: return 10
        default: return nil
        }
    }
    
    var maxLength: Int? {
        switch self {
        case .email, .password: return 50
        case .phone: return 10
        default: return nil
        }
    }
    
    var validationMessage: String? {
        switch self {
        case .email: return "Invalid Email"
        case .password: return "Password must have atleast 1 capital character, 1 number and minimum 8 characters"
        case .phone: return "Phone must be exact 10 digits"
        default: return nil
        }
    }
}
