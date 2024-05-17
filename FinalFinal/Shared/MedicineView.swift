//
//  MedicineView.swift
//  FinalFinal
//
//  Created by Nikhil ahuja on 5/9/24.
//
import SwiftUI

struct AddMedicineView: View {
    //declaring everything
    @Environment(\.presentationMode) var presentationMode
    @Binding var medicines: [Medicine]
    @State private var name: String = ""
    @State private var quantity: String = ""
    @State private var description: String = ""
    @State private var sideEffects: String = ""
    @State private var notes: String = ""
    @State private var selectedDays: [Bool] = Array(repeating: false, count: 7)
    let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    var body: some View {
        VStack {
            Form {
                //the GUI
                TextField("Medicine Name", text: $name)
                TextField("Quantity", text: $quantity)
                TextField("Description", text: $description)
                TextField("Side Effects", text: $sideEffects)
                TextField("Doctor's Notes", text: $notes)
                ForEach(0..<daysOfWeek.count, id: \.self) { index in
                    Toggle(daysOfWeek[index], isOn: $selectedDays[index])
                }
            }
            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(PlainButtonStyle())  //Apply a basic style button

                Button("Save") {
                    saveMedicine()
                }
                .buttonStyle(PlainButtonStyle())  //same button
            }
            .padding()
        }
        .frame(width: 400, height: 500)
        .padding()
    }

    //how it saves from the GUI
    func saveMedicine() {
        let daysSelected = selectedDays.enumerated().compactMap { index, isSelected in isSelected ? daysOfWeek[index] : nil }
        let newMedicine = Medicine(
            name: name,
            description: description,
            quantity: quantity,
            days: daysSelected,
            sideEffects: sideEffects,
            notes: notes
        )
        medicines.append(newMedicine)
        presentationMode.wrappedValue.dismiss()
    }
}
