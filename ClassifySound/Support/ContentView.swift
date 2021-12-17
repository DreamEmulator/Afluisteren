/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The top-level view for the app.
 */

import SwiftUI

/// The main view that contains the app content.
struct ContentView: View {
    /// Indicates whether to display the setup workflow.
    @State var showSetup = true
    
    /// A configuration for managing the characteristics of a sound classification task.
    @State var appConfig = AppConfiguration()
    
    /// The runtime state that contains information about the strength of the detected sounds.
    @StateObject var appState = AppState()
    
    
    var body: some View {
        ZStack {
            DetectSoundsView(state: appState,
                             config: $appConfig,
                             configureAction: { showSetup = true })
            PodFinderView(state: appState, config: $appConfig)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
