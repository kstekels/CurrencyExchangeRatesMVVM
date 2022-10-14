//
//  GetAllCurrenciesViewModelTest.swift
//  CurrencyExchangeRateMVVMTests
//
//  Created by karlis.stekels on 14/10/2022.
//

import XCTest
@testable import CurrencyExchangeRateMVVM

final class GetAllCurrenciesViewModelTest: XCTestCase {
    
    var sut: GetAllCurrenciesViewModel!
    
    override func setUpWithError() throws {
        sut = GetAllCurrenciesViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testForNotNil() {
        sut.getCurrencyRates(for: "USD") { vm in
            XCTAssertNotNil(vm)
        }
    }
    
    func testForVMKeysListIsGreaterThenOne() {
        sut.getCurrencyRates(for: "USD") { vm in
            XCTAssertGreaterThan(vm.keys.count, 1)
        }
    }
    
    deinit {
        sut = nil
    }
}
