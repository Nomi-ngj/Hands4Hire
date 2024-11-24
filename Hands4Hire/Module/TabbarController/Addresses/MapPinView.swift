//
//  MapPinView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 10/11/2024.
//

import SwiftUI
import MapKit

struct MapPinView: View {
    var coordinate: CLLocationCoordinate2D
    var region: MKCoordinateRegion
    
    var body: some View {
        VStack {
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)
                .padding(.bottom, 8)
        }
        .position(getPosition(for: coordinate, region: region))
    }
    
    private func getPosition(for coordinate: CLLocationCoordinate2D, region: MKCoordinateRegion) -> CGPoint {
        let mapPoint = MKMapPoint(coordinate)
        let mapRect = region.mapRect
        let x = (mapPoint.x - mapRect.origin.x) * UIScreen.main.bounds.width / mapRect.size.width
        let y = (mapPoint.y - mapRect.origin.y) * UIScreen.main.bounds.height / mapRect.size.height
        return CGPoint(x: x, y: y)
    }
}
