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
//    @State var foundPod: FoundPod? = FindablePods[0]
    @State var foundPod: FoundPod?
    var subscriptions = Set<AnyCancellable>()
    
    let height = UIScreen.main.bounds.size.height
    let width = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack{
            if let showPod = foundPod {
                Image(showPod.background)
                    .blur(radius: 5)
                
                VStack {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60, alignment: .trailing)
                        .offset(x: width / 3)
                        .onTapGesture {
                            foundPod = nil
                        }
                    
                    VStack {
                        Text("ik hoor")
                            .foregroundColor(.yellow)
                            .frame(maxWidth: width - width / 4, alignment: .topLeading)
                            .font(.system(size: 24, weight: .bold))
                            .shadow(radius: 5)
                        
                        Text(showPod.soundname)
                            .italic()
                            .frame(maxWidth: width - width / 4, alignment: .topLeading)
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .shadow(radius: 5)
                        
                        Text(showPod.tip)
                            .frame(maxWidth: width - width / 4, alignment: .topLeading)
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .shadow(radius: 5)
                    }
                    
                    
                    
                    
                    VStack {
                        
                        Image(showPod.cover)
                            .resizable()
                            .frame(width: width / 3, height: width / 3, alignment: .center)
                            .offset(x: width / 3.5, y: width / 6)
                            .zIndex(2)
                        
                        ZStack {
                            Circle()
                                .frame(width: width / 8, height: width / 8, alignment: .center)
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: width / 24, height: width / 24, alignment: .leading)
                                .foregroundColor(.white)
                        }.offset(x: -width / 4, y: width / 24)
                            .zIndex(1)
                        
                        Text(showPod.podcastTitle)
                            .frame(maxWidth: width - width / 4, alignment: .topLeading)
                            .padding()
                            .background(.black)
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .shadow(radius: 5)
                            .offset( y: width / 24)
                        
                        Text(showPod.podcastDescription)
                            .frame(maxWidth: width - width / 4)
                            .padding()
                            .background(.black)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                        
                    }
                    
                    
                }
                
            } else if !state.soundDetectionIsRunning {
                ZStack {
                    Image("listening")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    Text("Mag ik je afluisteren")
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .font(.system(size: 32, weight: .black))
                        .offset(y: height / 3)
                        .onTapGesture {
                            state.restartDetection(config: config)
                        }
                }
            } else {
                ZStack{
                    Rectangle()
                        .background(Color.black)
                        .edgesIgnoringSafeArea(.all)
                    Text("ik ben bezig...")
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .font(.system(size: 32, weight: .black))
                        .offset(y: UIScreen.main.bounds.size.height / 3)
                }
            }
            
        }.onReceive(state.$detectionStates){
            newState in
            let found = newState
                .filter({$0.1.currentConfidence > 0.6})
                .map {$0.0.displayName}
            if !found.isEmpty {
                let foundSoundName = found[0]
                let pod = FindablePods.first(where: {                   $0.sounds.contains {
                        $0 == foundSoundName
                    }
                })
                if let foundPodcast = pod {
                    title = foundPodcast.soundname
                    foundPod = foundPodcast
                }
            }
        }
    }
}
