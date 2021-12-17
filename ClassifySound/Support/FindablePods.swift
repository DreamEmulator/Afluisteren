//
//  FoundPods.swift
//  ClassifySound
//
//  Created by Sebastiaan Hols on 17/12/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import SwiftUI

struct FoundPod {
    var sounds: [String] // LabelNames from struct SoundIdentifier
    var title: String
    var subTitle: String
    var body: String
    var cover: String
    var background: String
}

var FindablePods: [FoundPod] = [
    water
]


let water =     FoundPod(
    sounds: ["Water",
             "Water Pump",
             "Water Tap Faucet",
             "Waterfall",
             "Glass Clink" // Remove
],
    title:"stromend water",
    subTitle: "misschien ben je bij een waterval of zit je op de wc",
    body: "Sterk water. In de podcast Sterk water hoor je ware verhalen van Terschelling die schuren, raken en verwonderen.",
    cover: "sterk_water",
    background:  "waterfall"
)

