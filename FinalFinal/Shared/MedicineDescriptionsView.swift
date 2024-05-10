//
//  MedicineDescriptionsView.swift
//  FinalFinal
//
//  Created by Nikhil ahuja on 5/9/24.
//

import SwiftUI

struct MedicineDescriptionsView: View {
    var medicines: [Medicine]

    var body: some View {
        List(medicines, id: \.id) { medicine in
            VStack(alignment: .leading) {
                Text(medicine.name).font(.headline)
                Text(medicine.description).font(.subheadline)
            }
        }
        .navigationTitle("Medicine Descriptions")
    }
}
