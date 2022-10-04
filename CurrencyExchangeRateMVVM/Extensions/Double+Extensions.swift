//
//  Double+Extensions.swift
//  CurrencyExchangeRateMVVM
//
//  Created by karlis.stekels on 05/10/2022.
//

import Foundation


extension Double {
    func formatCurrency() -> String {
        return String(format: "%.4f", self)
    }
}
