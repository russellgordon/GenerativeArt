//
//  TileView.swift
//  GenerativeArt
//
//  Created by Russell Gordon on 2023-10-24.
//

import SwiftUI

struct TileView: View {
    var body: some View {
        VStack {
            Rectangle()
                // Make the shape be a square
                .aspectRatio(1.0, contentMode: .fit)
        }
        .padding()
    }
}

#Preview {
    TileView()
}
