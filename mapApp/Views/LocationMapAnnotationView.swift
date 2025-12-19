//
//  LocationMapAnnotationView.swift
//  mapApp
//
//  Created by Venus Bhatia on 18/12/2025.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: -4){
            Image(systemName: "mappin.and.ellipse.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .font(.headline)
                .foregroundColor(.white)
                .padding(4)
                .background(accentColor)
                .cornerRadius(50)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .padding(.bottom, 70)
        }
    }
    
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        LocationMapAnnotationView()
    }
}
