//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Sanghun Park on 15.10.22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
