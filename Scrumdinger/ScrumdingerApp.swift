//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Sanghun Park on 15.10.22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
