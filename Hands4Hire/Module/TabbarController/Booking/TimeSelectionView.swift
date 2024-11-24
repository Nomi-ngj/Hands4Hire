//
//  TimeSelectionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 10/11/2024.
//


import SwiftUI

struct TimeSelectionView: View {
    @Binding var selectedTime: Date
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
//                    .background(.white)
                
            }
            .background(.clear)
            .navigationTitle("Select Time")
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

