//
//  NetworkManager.swift
//  CoinGeckoApp
//
//  Created by Nikolai Maksimov on 30.06.2022.
//

import Foundation


struct NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    let url = "https://api.coingecko.com/api/v3/exchange_rates"
    
    
    
    func fetchData(_ completion: @escaping (Rate) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "no error")
                return
            }
            do {
                let rate = try JSONDecoder().decode(Rate.self, from: data)
                
                completion(rate)
            } catch let error {
                print(error)
            }

        }.resume()
    }
    
}
