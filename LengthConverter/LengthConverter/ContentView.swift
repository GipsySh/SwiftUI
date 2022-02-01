//
//  ContentView.swift
//  LengthConverter
//
//  Created by Yulia on 25.01.2022.
//

import SwiftUI

extension UnitLength {
    static func name(for unit: UnitLength) -> String {
        switch unit {
        case .meters:
            return "m"
        case .kilometers:
            return "km"
        case .feet:
            return "ft"
        case .yards:
            return "yd"
        case .miles:
            return "mi"
        default:
            return ""
        }
    }
}

struct ContentView: View {
    @State private var selectedInputUnit: UnitLength = .meters
    @State private var inputValue: Double = 0.0
    
    @State private var selectedOutputUnit: UnitLength = .meters
    private var outputValue: Double {
        var inputMeasurement = Measurement(value: inputValue, unit: selectedInputUnit)
        inputMeasurement.convert(to: selectedOutputUnit)
        return inputMeasurement.value
    }
    
    let units: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    
    var body: some View {
        Form {
            Section {
                TextField("Enter value", value: $inputValue, format: .number, prompt: nil)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                
                Picker("Input units", selection: $selectedInputUnit) {
                    ForEach(units, id: \.self) {
                        let name = UnitLength.name(for: $0)
                        Text("\(name)").tag($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Input")
            }
            
            Section {
                Picker("Output units", selection: $selectedOutputUnit) {
                    ForEach(units, id: \.self) {
                        let name = UnitLength.name(for: $0)
                        Text("\(name)").tag($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Output")
            }
            
            Text("\(inputValue, specifier: "%.1f") \(UnitLength.name(for: selectedInputUnit)) is equal to \(outputValue, specifier: "%.1f") \(UnitLength.name(for: selectedOutputUnit))")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
