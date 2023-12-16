//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Arian Ahmadinejad on 2023-12-12.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
