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
    @Binding var config: AppConfiguration

    @State var title: String = ""
    @State var foundPod: FoundPod?
    var subscriptions = Set<AnyCancellable>()
    var body: some View {
        ZStack{
            if let foundPod = foundPod {
                Image("waterfall")
                VStack {
                    Text(foundPod.title)
                    Text(foundPod.subTitle)
                    Text(foundPod.body)
                    Image(foundPod.cover)
                        .frame(width: 100, height: 100, alignment: .center)
                }
            } else if !state.soundDetectionIsRunning {
                ZStack {
                    Image("listening")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    Text("Laat me luisteren")
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .font(.system(size: 32))
                        .onTapGesture {
                            state.restartDetection(config: config)
                        }
                }
            }

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
                    foundPod = foundPodcast
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
