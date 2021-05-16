//
//  AddCoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Siddesh A on 16/05/21.
//

import Foundation

class AddCoffeeViewModel: ObservableObject {
   
    var name: String = ""
    @Published var size: String = ""
    @Published var coffeeName: String = ""
    
    private var webservice: Webservice
    
    var coffeeList:[CoffeeViewModel]{
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init(){
        self.webservice = Webservice()
    }
    
    private func calculateTotalPrice()-> Double{
        let coffeeVM = coffeeList.first{ $0.name == coffeeName}
        
    }
}
