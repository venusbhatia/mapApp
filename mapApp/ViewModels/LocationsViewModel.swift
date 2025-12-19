//
//  LocationsViewModel.swift
//  mapApp
//
//  Created by Venus Bhatia on 13/12/2025.
//

import MapKit
import SwiftUI
import Combine

class LocationsViewModel: ObservableObject {
    
    // All Loaded Locations
    @Published var locations: [Location]
    
    // current Location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // current region on Map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    //show list of Locations
    @Published var showLocationsList: Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
       
        self.locations = locations
        
       if let firstValue = locations.first {
           self.mapLocation = firstValue
           self.updateMapRegion(location: firstValue)
       } else {
           fatalError("LocationsDataService returned an empty list; expected at least one location.")
       }
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
            }
    
    public func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
     func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
     
        let currentIndex = locations.firstIndex { location in
            return location == mapLocation
        }
        
        let nextIndex = currentIndex! + 1
        
        guard locations.indices.contains(nextIndex) else {
            
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
