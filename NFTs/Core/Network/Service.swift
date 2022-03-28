//
//  Service.swift
//  NFTs
//
//  Created by Pedro Felipe Coloma de Araujo on 26/03/22.
//

import Foundation

class Service<T: API> {
    let baseURL = "https://private-e5de09-nfts.apiary-mock.com"
    
    func fetch(api: T, callback: @escaping (Result<Data, Error>) -> Void) {
        
        let url = URL(string: baseURL + api.path)!
        
        print("\n===== REQUEST  \(api.method.rawValue)  \(url)  =====")
        
        var request = URLRequest(url: url)
        let session = URLSession.shared
        
        request.httpMethod = api.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(" 🚨 Failed: \(error.localizedDescription)")
                callback(.failure(error))
            }
            
            if let data = data {
                if let httpResponse = response as? HTTPURLResponse {
                    print(" ✅ Succeeded \(httpResponse.statusCode)\n \(String(data: data, encoding: .utf8)?.prefix(200) ?? "")\n")
                }
                callback(.success(data))
            }
        }
        
        task.resume()
    }
}
