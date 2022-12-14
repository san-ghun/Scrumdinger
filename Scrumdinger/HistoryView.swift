//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Sanghun Park on 19.11.22.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                
                Text("Time")
                    .font(.headline)
                Text(history.date.formatted(date: .omitted, time: .standard))
                //Text(history.date.formatted(date: .omitted, time: .shortened))
                //Text(history.date.formatted(date: .omitted, time: .complete))
                
                Text("Attendees")
                    .font(.headline)
                    .padding(.top)
                Text(history.attendeeString)
                
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
                
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(
            date: Date(timeIntervalSinceNow: -1_000_000),
            attendees: [DailyScrum.Attendee(name: "Jon"),
                        DailyScrum.Attendee(name: "Darla"),
                        DailyScrum.Attendee(name: "Luis")],
            lengthInMinutes: 10,
            transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
    }
    
    static var previews: some View {
        HistoryView(history: history)
    }
}
