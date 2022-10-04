//
//  CurrenciesResponse.swift
//  CurrencyExchangeRateMVVM
//
//  Created by karlis.stekels on 04/10/2022.
//

import Foundation

struct CurrenciesResponse: Decodable {
    let base: String
    let date: String
    let rates: [String:Double]
}
