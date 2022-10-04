//
//  CurrencyExchangeRateViewController.swift
//  CurrencyExchangeRateMVVM
//
//  Created by karlis.stekels on 04/10/2022.
//

import UIKit

class CurrencyExchangeRateViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var getAllCurrencyVM = GetAllCurrenciesViewModel()
    private var currencyVM: CurrencyViewModel?
    
    private let defaults = UserDefaults.standard
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(getBaseCurrencySymbol() ?? "") \(Constants.Titles.currencyTableViewTitle)"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        getAllCurrencyVM.getCurrencyRates(for: getBaseCurrency() ?? Constants.Currencies.EUR.rawValue) { viewModel in
            self.currencyVM = viewModel
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    private func getBaseCurrency() -> String? {
        return self.defaults.string(forKey: "base")
    }
    
    private func getBaseCurrencySymbol() -> String? {
        return self.defaults.string(forKey: "baseSymbol")
    }
    
    @IBAction func backBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
}


extension CurrencyExchangeRateViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currencyVM?.keys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.currencyCellIdentifier, for: indexPath) as! CurrencyExchangeRatesTableViewCell
        let currencyName = currencyVM?.keys[indexPath.row]
        cell.currencyLabel.text = currencyName
        cell.currencyValue.text = (self.currencyVM?.currencies.rates[currencyName!])!.formatCurrency()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
