//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Arian Ahmadinejad on 2023-12-23.
//

import PhotosUI
import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    @State private var avatarItem: PhotosPickerItem?

    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min ... max
    }

    var body: some View {
        List {
            HStack {
                Text("Avatar")
                Spacer()
                profile.avatar
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .foregroundColor(.blue)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(alignment: .bottomTrailing) {
                        PhotosPicker("", selection: $avatarItem, matching: .images)
                    }
                    .onChange(of: avatarItem) {
                        Task {
                            if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                                profile.avatar = loaded
                            } else {
                                print("Failed")
                            }
                        }
                    }
            }
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }

            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notification")
            }

            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }

            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
