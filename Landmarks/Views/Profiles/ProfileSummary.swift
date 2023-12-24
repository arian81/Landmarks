//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Arian Ahmadinejad on 2023-12-23.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    @Environment(ModelData.self) var modelData

    var body: some View {
        ScrollView {
            VStack(alignment: .trailing) {
                profile.avatar
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

                Text(profile.username)
                    .bold()
                    .font(.title)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Notifications: \(profile.prefersNotifications ? "ON" : "OFF")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)

                Divider()

                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)

                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                    .padding(.bottom)
                }

                Divider()

                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)

                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
