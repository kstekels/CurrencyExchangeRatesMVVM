//
//  CurrencyExchangeRatesTableViewCell.swift
//  CurrencyExchangeRateMVVM
//
//  Created by karlis.stekels on 04/10/2022.
//

import UIKit

class CurrencyExchangeRatesTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyValue: UILabel!
    
    func configureCell(_ currencyLabel: String, _ currencyValue: String) {
        self.currencyLabel.text = currencyLabel
        self.currencyValue.text = currencyValue
    }
}
