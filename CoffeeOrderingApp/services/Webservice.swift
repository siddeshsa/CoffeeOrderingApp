//
//  Webservice.swift
//  CoffeeOrderingApp
//
//  Created by Siddesh A on 16/05/21.
//

import Foundation
class Webservice{
    
    
    func createCoffeeOrder(order:Order, completion:@escaping (CreateOrderResponse?)->()){
    
        guard let url = URL(string: "http://island-bramble.glitch.me/orders" ) else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request){
            data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                completion(nil)
                }
                return
            }
            
           let createOrderResponse=try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
            completion(createOrderResponse)
            }
        }.resume()
    }
    
    
    
    
    
    func getAllOrders(completion: @escaping([Order]?)->()){
        guard let url = URL(string: "http://island-bramble.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){
            data,response,error in
            guard let data = data, error==nil else{
                DispatchQueue.main.async {
                completion(nil)
                }
                return
            }
            let orders = try?  JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
            
            
        }.resume()
    }
    
}
