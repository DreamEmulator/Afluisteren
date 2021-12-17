//
//  PodFinderView.swift
//  ClassifySound
//
//  Created by Sebastiaan Hols on 17/12/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

enum PodFinderState {
    case intial
    case finding
    case found
}

struct PodFinderView: View {
    @ObservedObject var state: AppState
    @State var title: String = ""
    var subscriptions = Set<AnyCancellable>()
    var body: some View {
        VStack {
            Text(title)
        }.onReceive(state.$detectionStates){
            newState in
            let found = newState
                .filter({$0.1.currentConfidence > 0.5})
                .map {$0.0.displayName}
            if !found.isEmpty {
                let foundSoundName = found[0]
                let pod = FindablePods.first(where: {
                    $0.sounds.contains {
                        $0 == foundSoundName
                    }
                })
                if let foundPodcast = pod {
                    title = foundPodcast.title
                }
            }
        }
    }
}


//if podFinderState == .intial {
//    Text("Laat me luisteren")
//} else if podFinderState == .finding {
//    Text("Bezig met luisteren")
//} else {
//    Text("Found")
//}
