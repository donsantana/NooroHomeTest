//
//  NoCitySelectedView.swift
//  Nooro
//
//  Created by Done Santana on 1/29/25.
//

import SwiftUI

struct NoCitySelectedView: View {
    var body: some View {
        VStack {
            Text(GlobalStrings.noCitySelectedMessage)
                .font(.title)
                .bold()
            Text(GlobalStrings.searchCityMessage)
                .font(.subheadline)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    NoCitySelectedView()
}
