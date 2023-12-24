//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Arian Ahmadinejad on 2023-12-14.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State private var showingProfile = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            !showFavoritesOnly || landmark.isFavorite
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    modelData.profile.avatar
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environment(modelData)
                }
            }
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
