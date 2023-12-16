//
//  ContentView.swift
//  Landmarks
//
//  Created by Arian Ahmadinejad on 2023-12-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
