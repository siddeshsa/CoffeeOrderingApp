//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Siddesh A on 16/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var OrderListVM = OrderListViewModel()
    
    
    var body: some View {
        
        
        NavigationView{
        OrderListView(orders: self.OrderListVM.orders)
        }.navigationTitle("Coffee Orders")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
