//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Arian Ahmadinejad on 2023-12-17.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false

    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }.listRowInsets(EdgeInsets())
            }.navigationTitle("Featured")
                .listStyle(.inset)
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
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
