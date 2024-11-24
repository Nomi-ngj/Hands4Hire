//
//  BookingViewModel.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 10/11/2024.
//


import SwiftUI
import MapKit

class BookingViewModel: ObservableObject {
    @Published var isServicePrivderSheetPresented = false
    @Published var isServiceSheetPresented = false
    @Published var isDateSheetPresented = false
    @Published var isTimeSheetPresented = false
    @Published var isLocationPressed = false
    @Published var isBookingConfirmed = false
    @Published var isConfirmDisable = true
    @Published var showToast = false
    @Published var selectedLocation: CLLocationCoordinate2D?
    @Published var selectedLocationName: String?{
        didSet {
            validate()
        }
    }
    @Published var selectedDate:Date?
    @Published var selectedTime:Date?
    @Published var tempDate = Date() {
        didSet {
            selectedDate = tempDate
            validate()
        }
    }
    @Published var tempTime = Date() {
        didSet {
            selectedTime = tempTime
            validate()
        }
    }
    @Published var selectedServices: [ServiceItem] = [] {
        didSet {
            validate()
        }
    }
    @Published var selectedServiceProvider: ServiceProvider? {
        didSet {
            if previousSelectedServiceProvider != selectedServiceProvider {
                self.selectedServices = []
                self.services = selectedServiceProvider?.services ?? []
                self.previousSelectedServiceProvider = selectedServiceProvider
            }
            validate()
        }
    }
    
    var toastMessage:String {
        if selectedServiceProvider == nil{
            return "Please select service provider"
        }else if selectedServices == [] {
            return "Please select services"
        }else if selectedDate == nil {
            return "Please select date"
        }else if selectedTime == nil {
            return "Please select time"
        }else if selectedLocationName == nil {
            return "Please select location"
        }else {
            return "This is a toast message"
        }
    }
    
    var selectedServicesTitles: String {
        if selectedServices.isEmpty {
            return "Selected Services"
        } else if selectedServices.count == 1 {
            return selectedServices[0].title
        } else if selectedServices.count == 2 {
            return selectedServices.map { $0.title }.joined(separator: ", ")
        } else {
            let firstTwoTitles = selectedServices.prefix(2).map { $0.title }
            return "\(firstTwoTitles.joined(separator: ", "))..."
        }
    }
    let minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    var services: [ServiceItem] = []
    let serviceProvider: [ServiceProvider] = ServiceProvider.serviceProviders // Holds multiple
    
    private var previousSelectedServiceProvider: ServiceProvider?
    
    init(serviceProvider: ServiceProvider? = nil) {
        self.selectedServiceProvider = serviceProvider
    }
    
    private func validate() {
        if let _ = selectedServiceProvider, !selectedServices.isEmpty, let _ = selectedDate, let _ = selectedTime, let _ = selectedLocationName {
            isConfirmDisable = false
        }else{
            isConfirmDisable = true
        }
    }
    
    func resetView(){
        selectedLocation = nil
        selectedLocationName = nil
        selectedDate = nil
        selectedTime = nil
        selectedServices = []
        selectedServiceProvider = nil
    }
}
