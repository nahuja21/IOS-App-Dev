//
//  ContentView.swift
//  Shared
//
//  Created by Nikhil ahuja on 5/9/24.
//
import SwiftUI

struct ContentView: View {
    @State private var medicines: [Medicine] = []
    @State private var showAddMedicine = false
    @State private var showRemovalOptions = false
    @State private var showSchedule = false
    @State private var showDescriptions = false
    @State private var selectedMedicine: Medicine?
    @State private var selectedDayForRemoval: String = "Monday"

    var body: some View {
        VStack {
            Spacer()

            Button("View Schedule") {
                showSchedule.toggle()
            }
            .buttonStyle(PrimaryButtonStyle())

            if showSchedule {
                MedicineScheduleView(medicines: $medicines)
            }

            Button("Add Medicine") {
                showAddMedicine = true
            }
            .buttonStyle(PrimaryButtonStyle())
            .sheet(isPresented: $showAddMedicine) {
                AddMedicineView(medicines: $medicines)
            }

            Button("Remove Medicine") {
                showRemovalOptions.toggle()
            }
            .buttonStyle(PrimaryButtonStyle())

            if showRemovalOptions {
                removalMenu
            }

            Button("View Medicine Descriptions") {
                showDescriptions.toggle()
            }
            .buttonStyle(PrimaryButtonStyle())

            if showDescriptions {
                List(medicines, id: \.id) { medicine in
                    Button(medicine.name) {
                        selectedMedicine = medicine
                    }
                }
                .frame(width: 300, height: 400)
            }

            Spacer()
        }
        .sheet(item: $selectedMedicine) { medicine in
            MedicineDetailsView(medicine: medicine)
        }
    }

    var removalMenu: some View {
        VStack(alignment: .leading) {
            Button("Back") {
                showRemovalOptions = false
            }
            .buttonStyle(PrimaryButtonStyle())

            Text("Select Day to Remove Medicine:")
            Picker("Select Day", selection: $selectedDayForRemoval) {
                ForEach(["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"], id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            List(medicines.filter { $0.days.contains(selectedDayForRemoval) }, id: \.id) { medicine in
                HStack {
                    Text("\(medicine.name) - \(medicine.quantity)")
                    Spacer()
                    Button(action: {
                        removeMedicine(medicine, fromDay: selectedDayForRemoval)
                    }) {
                        Image(systemName: "trash")
                    }
                }
            }
        }
        .padding()
    }

    func removeMedicine(_ medicine: Medicine, fromDay: String) {
        if let index = medicines.firstIndex(where: { $0.id == medicine.id }) {
            medicines[index].days.removeAll { $0 == fromDay }
            if medicines[index].days.isEmpty {
                medicines.remove(at: index)
            }
        }
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
    }
}
