//
//  Constants.swift
//  CurrencyExchangeRateMVVM
//
//  Created by karlis.stekels on 04/10/2022.
//

import Foundation


struct Constants {
    
    struct Titles {
        static let currencyTableViewTitle = "Exchange rate"
    }
    
    struct Symbols {
        static let EUR: String = "€"
        static let USD: String = "＄"
        static let GBP: String = "£"
        static let RUB: String = "₽"
        static let CNY: String = "¥"
    }
    
    static let SymbolsForCurrency: [String: String] = [
        Constants.Currencies.EUR.rawValue: Symbols.EUR,
        Constants.Currencies.USD.rawValue: Symbols.USD,
        Constants.Currencies.GBP.rawValue: Symbols.GBP,
        Constants.Currencies.RUB.rawValue: Symbols.RUB,
        Constants.Currencies.CNY.rawValue: Symbols.CNY,
    ]
    
    enum Currencies: String {
        case EUR = "EUR"
        case USD = "USD"
        case GBP = "GBP"
        case RUB = "RUB"
        case CNY = "CNY"
    }
    
    static let dataForPickerView: [String] = [
        Constants.Currencies.EUR.rawValue,
        Constants.Currencies.USD.rawValue,
        Constants.Currencies.GBP.rawValue,
        Constants.Currencies.RUB.rawValue,
        Constants.Currencies.CNY.rawValue,
    ]
    
    struct Cells {
        static let currencyCellIdentifier: String = "currencyCell"
    }
    
    struct Urls {
        static func urlForLatestExchangeRates(for baseCurrency: String?) -> URL {
         
            guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
                fatalError("Invalid API Key!")
            }
            
            return URL(string: "https://api.apilayer.com/exchangerates_data/latest?base=\(baseCurrency ?? Constants.Currencies.EUR.rawValue)&apikey=\(apiKey)")!
        }
    }
}
