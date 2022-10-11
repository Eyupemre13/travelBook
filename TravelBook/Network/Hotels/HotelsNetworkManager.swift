//
//  HotelsNetworkManager.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import Foundation

class HotelsNetworkManager {

    func getData<T: Decodable>(urlString: String, completionHandler: @escaping (T) -> Void ) {
        
        guard let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let url = URL(string: urlString) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("2c28969d10mshc3259ee19bf38c0p1087f4jsn4da746528d84", forHTTPHeaderField: "X-RapidAPI-Key")
                
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard let data = data else {
                if let error = error {
                    print(error)
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completionHandler(decodedData)
            } catch {
                print(error)
            }
        }).resume()
    }
}
