//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Sanghun Park on 17.11.22.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        VStack {
            Text("An error has occurred!")
                .font(.title)
                .padding(.bottom)
            Text(errorWrapper.error.localizedDescription)
                .font(.headline)
            Text(errorWrapper.guidance)
                .font(.caption)
                .padding(.top)
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
    case errorReqired
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorReqired,
                     guidance: "You can safely ignore this error.")
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
