//
//  GetAllCurrenciesViewModel.swift
//  CurrencyExchangeRateMVVM
//
//  Created by karlis.stekels on 04/10/2022.
//

import Foundation


class GetAllCurrenciesViewModel {
    func getCurrencyRates(for currency: String, completion: @escaping (CurrencyViewModel) -> Void) {
        let currenciesUrl = Constants.Urls.urlForLatestExchangeRates(for: Constants.Currencies.EUR.rawValue)
        
        let currenciesResponse = Resource<CurrenciesResponse>(url: currenciesUrl) { data in
            let currenciesResponse = try? JSONDecoder().decode(CurrenciesResponse.self, from: data)
            return currenciesResponse
        }
        
        WebService().load(resource: currenciesResponse) { (result) in
            if let currencyResource = result {
                let viewModel = CurrencyViewModel(currencies: currencyResource)
                completion(viewModel)
            }
        }
        
    }
}
