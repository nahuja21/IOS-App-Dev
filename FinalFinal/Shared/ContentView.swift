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

    //add all the buttons to the main page
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
                listMedicines
            }

            Spacer()
        }
        .sheet(item: $selectedMedicine) { medicine in
            MedicineDetailsView(medicine: medicine)
        }
    }

    //save list of all the meds
    var listMedicines: some View {
        List(medicines, id: \.id) { medicine in
            VStack(alignment: .leading) {
                Text(medicine.name)
                    .font(.headline)
                    .padding(.bottom, 2)
                Text("Dosage: \(medicine.quantity)")
                    .font(.subheadline)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
            .onTapGesture {
                selectedMedicine = medicine
            }
        }
    }

    //make the remove with trash cans show up
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
    //more remove medicine logic
    func removeMedicine(_ medicine: Medicine, fromDay: String) {
        if let index = medicines.firstIndex(where: { $0.id == medicine.id }) {
            medicines[index].days.removeAll { $0 == fromDay }
            if medicines[index].days.isEmpty {
                medicines.remove(at: index)
            }
        }
    }
}
//button code to make sure all the buttons are the same
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
