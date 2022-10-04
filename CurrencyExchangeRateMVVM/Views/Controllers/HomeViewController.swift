//
//  HomeViewController.swift
//  CurrencyExchangeRateMVVM
//
//  Created by karlis.stekels on 04/10/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var pickerVIew: UIPickerView!
    @IBOutlet weak var textLabel: UILabel!
    
    private var selectedCurrency: String?
    private var selectedCurrencySymbol: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerVIew.delegate = self
        self.pickerVIew.dataSource = self

    }
    
    @IBAction func selectBtnPressed(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(self.selectedCurrency, forKey: "base")
        defaults.set(self.selectedCurrencySymbol, forKey: "baseSymbol")
    }
    
}


extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.dataForPickerView.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Constants.SymbolsForCurrency[Constants.dataForPickerView[row]]!) \(Constants.dataForPickerView[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedCurrency = Constants.dataForPickerView[row]
        self.selectedCurrencySymbol = Constants.SymbolsForCurrency[Constants.dataForPickerView[row]]
    }
}
