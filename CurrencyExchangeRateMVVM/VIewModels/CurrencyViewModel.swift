//
//  CurrencyViewModel.swift
//  CurrencyExchangeRateMVVM
//
//  Created by karlis.stekels on 04/10/2022.
//

import Foundation

class CurrencyViewModel {
    let currencies: CurrenciesResponse
    let keys: [String]
    
    init(currencies: CurrenciesResponse) {
        self.currencies = currencies
        self.keys = Array(currencies.rates.keys).sorted()
    }
}
