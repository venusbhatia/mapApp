//
//  LocationDetailView.swift
//  mapApp
//
//  Created by Venus Bhatia on 18/12/2025.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel

    let location: Location
    
    var body: some View {
        ScrollView{
            VStack{
                imageSection
                    .cornerRadius(35)
                    .padding(.horizontal)
                    .shadow(color: Color.white,radius: 20)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(Color.accentColor.opacity(1.8))
        .overlay(backButton, alignment: .topLeading)
    }
}

#Preview {
        if let firstLocation = LocationsDataService.locations.first {
        LocationDetailView(location: firstLocation)
                .environmentObject(LocationsViewModel())
    }
}

extension LocationDetailView {
    
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .foregroundColor(.white.opacity(0.7))
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.title)
                .foregroundColor(.white.opacity(0.4))
                .fontWeight(.semibold)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
                .shadow(color: Color.white,radius: 10)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            
            Divider()
            
            Link("Tap here to Read More on Wikipedia 📖", destination: location.link)
                .font(.headline)
                .tint(.white)
                .shadow(color: Color.white,radius: 10)
                .padding(.vertical)
        }
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: vm.mapSpan)), annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
            LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
            }
        .background(.ultraThinMaterial)
        .allowsHitTesting(false)
        .aspectRatio(2, contentMode: .fit)
        .cornerRadius(45)
        }
    
    private var backButton: some View {
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.title2)
                .padding(6)
        }
        .buttonStyle(.glass)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
    }
}
