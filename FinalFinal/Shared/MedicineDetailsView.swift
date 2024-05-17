//
//  MedicineDetailsView.swift
//  FinalFinal
//
//  Created by Nikhil ahuja on 5/9/24.
//

import SwiftUI

struct MedicineDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    var medicine: Medicine

    //the gui that shows up when you want to view a med
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(medicine.name)")
                .font(.title)
            Text("Description: \(medicine.description)")
            Text("Dosage: \(medicine.quantity)")
            if let sideEffects = medicine.sideEffects {
                Text("Side Effects: \(sideEffects)")
            }
            if let notes = medicine.notes {
                Text("Doctor's Notes: \(notes)")
            }
            Spacer()
            Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(width: 400, height: 300)
        .onAppear {
            //Ensure the window can be resizable or set a fixed size if needed.
            if let window = NSApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                window.standardWindowButton(.zoomButton)?.isEnabled = true
            }
        }
    }
}
