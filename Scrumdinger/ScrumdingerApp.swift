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
                ScrumsView(scrums: $store.scrums) {
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        }
                        catch {
                            fatalError("Error saving scrums.")
                        }
                    }
                }
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                }
                catch {
                    fatalError("Error loading scrums.")
                }
            }
        }
    }
}
