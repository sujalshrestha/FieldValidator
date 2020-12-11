//
//  FieldValidatorsTests.swift
//  FieldValidatorsTests
//
//  Created by Sujal on 11/12/2020.
//

import XCTest
@testable import FieldValidators

class FieldValidatorsTests: XCTestCase {

    override class func setUp() {
        super.setUp()
    }

    func testEmailValid() {
        let validator = FieldValidator(fieldType: .email)
        let isValid = validator.isEmailValid(text: "suj@gmail.com")
        XCTAssertTrue(isValid)
    }
    
    func testEmailInValid() {
        let validator = FieldValidator(fieldType: .email)
        let isValid = validator.isEmailValid(text: "s@s")
        XCTAssertFalse(isValid)
    }
    
    func testMinLengthValid() {
        let validator = FieldValidator(fieldType: .email)
        let isValid = validator.isMinLength(text: "sujalshr")
        XCTAssertTrue(isValid)
    }
    
    func testMinLengthInValid() {
        let validator = FieldValidator(fieldType: .email)
        let isValid = validator.isMinLength(text: "sj")
        XCTAssertFalse(isValid)
    }
    
    func testMaxLengthValid() {
        let validator = FieldValidator(fieldType: .email)
        let isValid = validator.isMaxLength(text: "sujalallalaalalalalala")
        XCTAssertTrue(isValid)
    }
    
    func testMaxLengthInValid() {
        let validator = FieldValidator(fieldType: .email)
        let isValid = validator.isMaxLength(text: "sujalallalaalalalalalasujalallalaalalalalalasujalallalaalalalalalasujalallalaalalalalalasujalallalaalalalalalasujalallalaalalalalalasujalallalaalalalalalasujalallalaalalalalalasujalallalaalalalalalasujalallalaalalalalalasujalallalaalalalalala")
        XCTAssertFalse(isValid)
    }
    
    func testPasswordValid() {
        let validator = FieldValidator(fieldType: .password)
        let isValid = validator.isPasswordValid(text: "Sujal123")
        XCTAssertTrue(isValid)
    }
    
    func testPasswordInValid() {
        let validator = FieldValidator(fieldType: .password)
        let isValid = validator.isPasswordValid(text: "sjl123")
        XCTAssertFalse(isValid)
    }
    
}
