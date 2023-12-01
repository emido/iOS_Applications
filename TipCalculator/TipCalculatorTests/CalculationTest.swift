//
//  CalculationTest.swift
//  TipCalculatorTests
//
//  Created by Maryam on 2023-11-30.
//

import XCTest
@testable import TipCalculator

final class CalculationTest: XCTestCase {

    func testSuccessfulTipCalculation() {
        // Given (Arrange)
        let enteredAmount = 100.00
        let tipSlider = 25.0
        let calculation = Calculation()
        
        // When  (Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then  (Assert)
        XCTAssertEqual(tip, 25)
    }
    
    func testNegativeEnteredAmountTipCalculation() {
        // Given (Arrange)
        let enteredAmount = -100.00
        let tipSlider = 25.0
        let calculation = Calculation()
        
        // When  (Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then  (Assert)
        XCTAssertNil(tip)
    }

}
