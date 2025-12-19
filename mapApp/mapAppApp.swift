//
//  mapAppApp.swift
//  mapApp
//
//  Created by Venus Bhatia on 12/12/2025.
//

import SwiftUI

@main
struct mapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
           LocationsView()
		.environmentObject(vm)
        }
    }
}
