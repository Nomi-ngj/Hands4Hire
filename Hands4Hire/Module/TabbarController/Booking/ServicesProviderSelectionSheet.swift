//
//  ServicesProviderSelectionSheet.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 10/11/2024.
//


import SwiftUI

struct ServicesProviderSelectionSheet: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let services: [ServiceProvider]
    @Binding var selectedService: ServiceProvider?
    
    var body: some View {
        NavigationStack {
            List(services, id: \.id) { service in
                HStack {
                    Text(service.name)
                    Spacer()
                    if selectedService?.id == service.id {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    toggleSelection(for: service)
                }
            }
            .navigationTitle("Select Service Provider")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        selectedService = selectedService
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
    
    private func toggleSelection(for service: ServiceProvider) {
        selectedService = service
    }
}


