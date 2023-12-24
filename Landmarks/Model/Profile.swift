//
//  Profile.swift
//  Landmarks
//
//  Created by Arian Ahmadinejad on 2023-12-23.
//

import Foundation
import SwiftUI

struct Profile {
    var username: String
    var prefersNotifications: Bool = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    var avatar: Image

    static let `default` = Profile(
        username: "arian81",
        avatar: Image(systemName: "person.crop.circle")
    )

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌱"
        case summer = "⛱️"
        case autumn = "🍁"
        case winter = "❄️"

        var id: String { rawValue }
    }
}
