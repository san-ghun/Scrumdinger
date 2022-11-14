//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Sanghun Park on 15.10.22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums)
            }
            .onAppear {
                ScrumStore.load { result in
                    switch result {
                    case .success(let scrums):
                        store.scrums = scrums
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    }
                }
            }
        }
    }
}
