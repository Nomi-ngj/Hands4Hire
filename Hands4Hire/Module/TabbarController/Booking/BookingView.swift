//
//  BookingView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 10/11/2024.
//

import SwiftUI
import MapKit




struct BookingView: View {
    @ObservedObject var viewModel:BookingViewModel
    @EnvironmentObject var appManager: AppContainerManager
    @EnvironmentObject var router: Router
    @State private var selectedRegion = MKCoordinateRegion(
           center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
           span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
       )
    
    var body: some View {
        ZStack {
            // Your existing view content
            VStack(spacing: 20) {
                serviceProviderButton
                servicesButton
                dateButton
                timeButton
                selectLocation
                Spacer()
                
                confirmBookingButton
                
                EmptyView().frame(height: 20)
            }
            .padding()
            .navigationTitle("Booking")
            
            if viewModel.isBookingConfirmed {
                withAnimation {
                    showAlert
                }
            }
            
            if viewModel.showToast {
                ToastView(message: viewModel.toastMessage)
                    .transition(.move(edge: .top))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            viewModel.showToast = false
                        }
                    }
            }
        }
    }
    
    @ViewBuilder
    private var showAlert: some View {
        CustomAlertView(
            alertParams: .init(
                title: "Booking Confirmed",
                message: "Your booking is confirmed on \(viewModel.tempDate.formatted(date: .abbreviated, time: .omitted)) at \(viewModel.tempTime.formatted(date: .omitted, time: .shortened))",
                confirmAction: {
                    viewModel.resetView()
                    viewModel.isBookingConfirmed = false
                }
            ),
            shouldShow: $viewModel.isBookingConfirmed
        )
    }
    
    @ViewBuilder
    private var confirmBookingButton: some View {
        // Confirmation Button
        Button(action: {
            if viewModel.isConfirmDisable {
                viewModel.showToast.toggle()
            }else{
                viewModel.isBookingConfirmed.toggle()
            }
            
        }) {
            Text("Confirm Booking")
                .fontWeight(.bold)
                .font(Theme.fonts.footnoteMedium)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(viewModel.isConfirmDisable ? Color.gray : appManager.theme.color.primaryColor)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private var serviceProviderButton: some View {
        Button(action: { viewModel.isServicePrivderSheetPresented = true }) {
            selectionRow(
                title: viewModel.selectedServiceProvider?.name ?? "Select Service Provider",
                icon: "briefcase.fill",
                isHighlighted: viewModel.selectedServiceProvider != nil
            )
        }
        .sheet(isPresented: $viewModel.isServicePrivderSheetPresented) {
            ServicesProviderSelectionSheet(
                services: viewModel.serviceProvider,
                selectedService: $viewModel.selectedServiceProvider
            )
            .presentationDetents([.medium, .large])
        }
    }

    @ViewBuilder
    private var servicesButton: some View {
        Button(action: { viewModel.isServiceSheetPresented = true }) {
            selectionRow(
                title: viewModel.selectedServicesTitles,
                icon: "list.bullet",
                isHighlighted: !viewModel.selectedServices.isEmpty
            )
        }
        .background(viewModel.selectedServiceProvider == nil ? .red.opacity(0.4):.clear)
        .cornerRadius(8)
        .disabled(viewModel.selectedServiceProvider == nil)
        .sheet(isPresented: $viewModel.isServiceSheetPresented) {
            ServicesSelectionSheet(
                services: viewModel.services,
                selectedServices: $viewModel.selectedServices
            )
            .presentationDetents([.medium, .large])
        }
    }

    @ViewBuilder
    private var dateButton: some View {
        Button(action: { viewModel.isDateSheetPresented = true }) {
            selectionRow(
                title: viewModel.selectedDate != nil ? "Date: \(viewModel.selectedDate!.formatted(date: .abbreviated, time: .omitted))" : "Select Date",
                icon: "calendar",
                isHighlighted: viewModel.selectedDate != nil
            )
        }
        .sheet(isPresented: $viewModel.isDateSheetPresented) {
            DateSelectionView(selectedDate: $viewModel.tempDate, minimumDate: viewModel.minimumDate)
                .presentationDetents([.medium])
        }
    }

    @ViewBuilder
    private var timeButton: some View {
        Button(action: { viewModel.isTimeSheetPresented = true }) {
            selectionRow(
                title: viewModel.selectedTime != nil ? "Time: \(viewModel.selectedTime!.formatted(date: .omitted, time: .shortened))" : "Select Time",
                icon: "clock",
                isHighlighted: viewModel.selectedTime != nil
            )
        }
        .sheet(isPresented: $viewModel.isTimeSheetPresented) {
            TimeSelectionView(selectedTime: $viewModel.tempTime)
                .presentationDetents([.height(230)])
        }
    }
    
    @ViewBuilder
    private var selectLocation: some View {
        Button(action: { viewModel.isLocationPressed = true }) {
            selectionRow(
                title: viewModel.selectedLocationName ?? "Select Location",
                icon: "location.circle",
                isHighlighted: viewModel.selectedLocationName != nil
            )
        }
        .sheet(isPresented: $viewModel.isLocationPressed) {
            LocationSelectionView(selectedLocation: $viewModel.selectedLocation, locationName: $viewModel.selectedLocationName, region: $selectedRegion, onLocationSelected: { locationSelected in
                debugPrint(locationSelected)
            })
            .presentationDetents([.large])
        }
    }

    // MARK: - Helper Function
    private func selectionRow(title: String, icon: String, isHighlighted: Bool) -> some View {
        HStack {
            Text(title)
                .font(Theme.fonts.caption1)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: icon)
                .foregroundColor(isHighlighted ? appManager.theme.color.primaryColor : .gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground.withAlphaComponent(0.6)))
        .cornerRadius(8)
    }
}
