//
//  WebServiceTest.swift
//  CurrencyExchangeRateMVVMTests
//
//  Created by karlis.stekels on 14/10/2022.
//

import XCTest
@testable import CurrencyExchangeRateMVVM

final class WebServiceTest: XCTestCase {

    var sut: WebService!
    
    override func setUpWithError() throws {
        sut = WebService()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testWebServiceForNil() {
        let url = URL(string: "https://www.google.com")!
        let resource = Resource<CurrenciesResponse>(url: url) { data in
            return nil
        }
        sut.load(resource: resource) { (result) in
            XCTAssertNil(result)
        }
    }
    
    func testWebServiceForDataNotNil() {
        let url = Constants.Urls.urlForLatestExchangeRates(for: "USD")
        let resource = Resource<CurrenciesResponse>(url: url) { data in
            let res = try? JSONDecoder().decode(CurrenciesResponse.self, from: data)
            return res
        }
        
        sut.load(resource: resource) { (result) in
            XCTAssertNotNil(result)
        }
    }
    
    deinit {
        sut = nil
    }

}
