//
//  Measurement.swift
//  cookbook
//
//  Created by laihj on 2024/1/10.
//

import SwiftUI
import Foundation

class MeasurementStore:ObservableObject {
    @Published var unit:UnitLength = UnitLength.kilometers
    
    func formatKmWithUnit(meters:Double) -> String {
        let measurement = Measurement(value: meters, unit: UnitLength.meters)

        let kilometers = measurement.converted(to: unit)

        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.unitOptions = .providedUnit
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2

        measurementFormatter.numberFormatter = numberFormatter
        
        return measurementFormatter.string(from: kilometers)
    }
}

struct MeasurementView: View {
    @ObservedObject var store = MeasurementStore.init()
    
    var body: some View {
        Text(store.formatKmWithUnit(meters: 112345))
        
        Button {
            store.unit = UnitLength.miles
        } label: {
            Text("change")
        }

    }
}





#Preview {
    MeasurementView()
}
