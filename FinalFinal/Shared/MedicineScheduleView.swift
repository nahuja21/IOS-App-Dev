//
//  MedicineScheduleView.swift
//  FinalFinal
//
//  Created by Nikhil ahuja on 5/9/24.
//

import SwiftUI

struct MedicineScheduleView: View {
    @Binding var medicines: [Medicine]
    @State private var selectedDay: String = "Monday"

    var body: some View {
        VStack {
            Picker("Select Day", selection: $selectedDay) {
                ForEach(["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"], id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            List(medicines.filter { $0.days.contains(selectedDay) }, id: \.id) { medicine in
                Text("\(medicine.name) - \(medicine.quantity)")
            }
        }
        .padding()
        .navigationTitle("View Schedule")
    }
}
