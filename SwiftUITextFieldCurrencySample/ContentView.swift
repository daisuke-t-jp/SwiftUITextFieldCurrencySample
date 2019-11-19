//
//  ContentView.swift
//  SwiftUITextFieldCurrencySample
//
//  Created by Daisuke TONOSAKI on 2019/11/19.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var input: Int? = 0
    
    func formatter(currencyCode: String) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.maximumFractionDigits = 0
        formatter.maximumIntegerDigits = 8
        return formatter
    }
    
    @State private var codeIndex = 0
    var codeArray = ["USD", "EUR", "JPY"]
    
    
    var body: some View {
        VStack {
            
            Text("Select currency code")
            
            Picker(selection: $codeIndex,
                   label: Text("Select currency code.")) {
                ForEach(0..<codeArray.count) { index in
                    Text(self.codeArray[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Spacer()
                .frame(height: 32)
            
            TextField("input here", value: $input, formatter: formatter(currencyCode: codeArray[codeIndex]))
                .frame(width: 300)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
