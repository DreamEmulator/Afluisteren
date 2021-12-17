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
    var soundname: String
    var tip: String
    var podcastTitle: String
    var podcastDescription: String
    var cover: String
    var background: String
}

var FindablePods: [FoundPod] = [
    water,
    dog,
    alcohol,
    office,
    corona
]


let water = FoundPod(
    sounds: ["Water",
             "Water Pump",
             "Water Tap Faucet",
             "Waterfall"
            ],
    soundname:"stromend water",
    tip: "misschien ben je bij een waterval of zit je op de wc",
    podcastTitle: "Sterk water.",
    podcastDescription: "In de podcast Sterk water hoor je ware verhalen van Terschelling die schuren, raken en verwonderen.",
    cover: "sterk_water",
    background:  "waterfall"
)

let alcohol = FoundPod(
    sounds: [
        "Gargling",
        "Glass Clink"
    ],
    soundname:"glas klinken",
    tip: "mogelijk ben je in een bar of bij de glasbak",
    podcastTitle: "Eerlijk over alcohol",
    podcastDescription: "Presentator Koos van Plateringen komt met een nieuwe podcast. In Eerlijk over alcohol vertellen hij en andere BN'ers over hun ervaringen met drank.",
    cover: "koos_alcohol",
    background:  "alcohol"
)

let dog = FoundPod(
    sounds: ["Accoustic Guitar",
             "Applause",
             "Dog",
             "Dog Bark",
             "Dog Growl",
             "Dog Howl",
             "Dog Whimper",
             "Flute",
             "Violin Fiddle"
            ],
    soundname:"een hond",
    tip: "zeg hoi tegen hond namens mij",
    podcastTitle: "Beethoven is meer dan een hond. ",
    podcastDescription: "Klassieke muziek... eh, Bach? In de vijfdelige podcast 'Beethoven is meer dan een hond' vertellen Jet en Fieke alles wat je moet weten over klassieke muziek.",
    cover: "beethoven",
    background:  "dog"
)

let office = FoundPod(
    sounds: [
        "Printer",
        "Typewriter",
        "Typing",
        "Typing Computer Keyboard",
        "Screaming"
    ],
    soundname:"dat je typt",
    tip: "neem even pauze!",
    podcastTitle: "Gothrecht",
    podcastDescription: "Gothrecht is een absurdistisch fictief hoorspel met originele muziek. Een gothic vrouw genaamd Brinta, moet zich voor de liefde een weg banen uit het 'Pierre Bokma-kantoorcomplex'",
    cover: "gothrecht",
    background:  "office"
)

let corona = FoundPod(
    sounds: [
        "Ambulance Siren",
        "Beep",
        "Cough",
        "Sneeze"
    ],
    soundname: "je hoesten",
    tip: "Oh jee! Positief getest?",
    podcastTitle: "Coronastrijders",
    podcastDescription: "Het personeel in de Noord-Hollandse ziekenhuizen werkt harder dan ooit, nu de coronacrisis de wereld al maanden in zijn greep heeft.",
    cover: "coronastrijders",
    background: "hospital"
)
