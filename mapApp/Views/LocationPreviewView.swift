//
//  LocationPreviewView.swift
//  mapApp
//
//  Created by Venus Bhatia on 17/12/2025.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            VStack(alignment: .leading, spacing: 2) {
                ImageSection
                titleSection
            }
            
            VStack(spacing: 10) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(.ultraThinMaterial)
                .offset(y: 60)        )
        .padding()
        .cornerRadius(25)
    }
}

#Preview {
    
    if let itemFirst = LocationsDataService.locations.first {
        ZStack {
            Color.blue.ignoresSafeArea()
            LocationPreviewView(location: itemFirst)
        }
    }
}

extension LocationPreviewView {
    
    private var ImageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
                    .cornerRadius(25)
            }
        }
        .padding(6)
        .background(Color.white.opacity(0.1))
        .cornerRadius(20)
    }
    
    private var titleSection: some View {
        VStack(spacing: 0) {
            Text(location.name + ", " + location.cityName)
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: 140, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn More")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 125, height: 10)
                .padding()
        }
        .buttonStyle(.glass)
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 125, height: 10)
                .padding()
        }
        .buttonStyle(.glass)
    }
    
}
