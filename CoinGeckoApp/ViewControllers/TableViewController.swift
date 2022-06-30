//
//  TableViewController.swift
//  CoinGeckoApp
//
//  Created by Nikolai Maksimov on 30.06.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var rates: [String: RateValue] = [:] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
        
        NetworkManager.shared.fetchData { rate in
            self.rates = rate.rates
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        rates.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CoinCell else { return UITableViewCell() }
        
        var rates: [RateValue] = []
        
        for (_, value) in self.rates {
            rates.append(value)
        }
        
        let rate = rates[indexPath.section]
        
//        cell.nameLabel.text = rate.name
        cell.unitLabel.text = rate.unit
        
        cell.valueLabel.text = "\(rate.value)"
        cell.typeLabel.text = rate.type.rawValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var values: [RateValue] = []
        
        for (_, value) in rates {
           values.append(value)
        }
        
        return values[section].name
    }
}


