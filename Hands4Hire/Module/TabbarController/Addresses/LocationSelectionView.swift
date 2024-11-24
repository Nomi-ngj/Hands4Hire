//
//  LocationSelectionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 10/11/2024.
//

import SwiftUI
import MapKit

struct LocationSelectionView: View {
    @Binding var selectedLocation: CLLocationCoordinate2D?
    @Binding var locationName: String?
    @Environment(\.presentationMode) var presentationMode
    @Binding var region: MKCoordinateRegion
    var onLocationSelected: (CLLocationCoordinate2D) -> Void
    
    @EnvironmentObject var appManager: AppContainerManager
    var body: some View {
        NavigationStack {
            ZStack {
                
                Map(coordinateRegion: $region, interactionModes: [.all])
                    .onTapGesture { location in
                        let coordinate = convertToCoordinate(from: location)
                        selectedLocation = coordinate
                        fetchLocationName(for: coordinate)
                        onLocationSelected(coordinate)
                    }
                    .ignoresSafeArea(edges: .bottom)
                
                // Indicator for the selected location
                
                if let selectedLocation = selectedLocation {
                    MapPinView(coordinate: selectedLocation, region: region)
                }
                
                // Location Name Display
                if let locationName {
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Text(locationName)
                            .foregroundColor(appManager.theme.color.whiteColor)
                            .padding()
                            .background(appManager.theme.color.blackColor.opacity(0.7))
                            .cornerRadius(10)
                            .padding(.top, 20)
                        
                        Spacer()
                    }
                    .padding()
                }
                
            }
            .navigationTitle("Select Location")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
    
    // MARK: - Helper Functions
    private func convertToCoordinate(from location: CGPoint) -> CLLocationCoordinate2D {
        let mapPoint = MKMapPoint(
            x: Double(location.x / UIScreen.main.bounds.width * region.mapRect.size.width + region.mapRect.origin.x),
            y: Double(location.y / UIScreen.main.bounds.height * region.mapRect.size.height + region.mapRect.origin.y)
        )
        return mapPoint.coordinate
    }
    
    private func fetchLocationName(for coordinate: CLLocationCoordinate2D) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Failed to get location name: \(error.localizedDescription)")
                self.locationName = "Unknown location"
            } else if let placemark = placemarks?.first {
                self.locationName = [
                    placemark.name,
                    placemark.locality,
                    placemark.administrativeArea,
                    placemark.country
                ].compactMap { $0 }.joined(separator: ", ")
            } else {
                self.locationName = "Unknown location"
            }
        }
    }
}

// Extension to convert MKCoordinateRegion to MKMapRect
extension MKCoordinateRegion {
    var mapRect: MKMapRect {
        let topLeft = MKMapPoint(CLLocationCoordinate2D(latitude: center.latitude + span.latitudeDelta / 2,
                                                        longitude: center.longitude - span.longitudeDelta / 2))
        let bottomRight = MKMapPoint(CLLocationCoordinate2D(latitude: center.latitude - span.latitudeDelta / 2,
                                                            longitude: center.longitude + span.longitudeDelta / 2))
        
        return MKMapRect(
            origin: MKMapPoint(x: min(topLeft.x, bottomRight.x), y: min(topLeft.y, bottomRight.y)),
            size: MKMapSize(width: abs(topLeft.x - bottomRight.x), height: abs(topLeft.y - bottomRight.y))
        )
    }
}
