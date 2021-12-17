//
//  PodFinderView.swift
//  ClassifySound
//
//  Created by Sebastiaan Hols on 17/12/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import SwiftUI

enum PodFinderState {
    case intial
    case finding
    case found
}

struct PodFinderView: View {
    @State var podFinderState: PodFinderState = .intial
    
    var body: some View {
        ZStack {
            if podFinderState == .intial {
                Text("Laat me luisteren")
            } else if podFinderState == .finding {
                Text("Bezig met luisteren")
            } else {
                Text("Found")
            }
        }
    }
}
