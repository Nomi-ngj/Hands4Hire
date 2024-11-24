//
//  ServicesSelectionSheet.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 10/11/2024.
//


import SwiftUI

struct ServicesSelectionSheet: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let services: [ServiceItem]
    @Binding var selectedServices: [ServiceItem]
    
    var body: some View {
        NavigationStack {
            List(services, id: \.id) { service in
                HStack {
                    Text(service.title)
                    Spacer()
                    if selectedServices.contains(service) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    toggleSelection(for: service)
                }
            }
            .navigationTitle("Select Services")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        selectedServices = selectedServices
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
    
    private func toggleSelection(for service: ServiceItem) {
        if selectedServices.contains(service) {
            selectedServices.removeAll { $0.id == service.id }
        } else {
            selectedServices.append(service)
        }
    }
}

