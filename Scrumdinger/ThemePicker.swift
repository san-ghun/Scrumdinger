//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Sanghun Park on 18.10.22.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
//        .background {
//            RoundedRectangle(cornerRadius: 4)
//                .fill(selection.mainColor)
//        }
//        .foregroundColor(selection.accentColor)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
