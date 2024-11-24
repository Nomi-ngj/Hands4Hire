//
//  DateSelectionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 10/11/2024.
//


import SwiftUI

struct DateSelectionView: View {
    @Binding var selectedDate: Date
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // Set the minimum date to today's date
    var minimumDate = Date()
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("Select Date", selection: $selectedDate, in: minimumDate..., displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                Spacer()
            }
            .navigationTitle("Select Date")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        
    }
}

