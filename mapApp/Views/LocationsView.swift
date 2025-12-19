//
//  LocationView.swift
//  mapApp
//
//  Created by Venus Bhatia on 13/12/2025.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
@EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            mapLayer.ignoresSafeArea()
            VStack(spacing: 0) {
            header.padding()
                Spacer()
                locationsPreviewStack
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
	.environmentObject(LocationsViewModel())
}


extension LocationsView{
    private var header: some View {
        VStack{
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "location.fill")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
            }
        }
            
            if vm.showLocationsList{
                LocationsListView()
            }
        }
        .background(.ultraThinMaterial)
        .cornerRadius(21)
        .shadow(color: Color.black.opacity(0.3), radius:10, x:0, y:20)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
            LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1.4 : 0.8)
                    .shadow(radius: 15)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var locationsPreviewStack: some View {
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}


