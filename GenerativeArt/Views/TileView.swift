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
            // Top right triangle
            TriangleTopRight()
                .stroke(.black)
                .fill(.clear)
                // Make the shape be a square
                .aspectRatio(1.0, contentMode: .fit)
            
            // Bottom left triangle
            TriangleBottomLeft()
                .stroke(.black)
                .fill(.clear)
                // Make the shape be a square
                .aspectRatio(1.0, contentMode: .fit)
            
            // Top left right
            TriangleTopLeft()
                .stroke(.black)
                .fill(.clear)
                // Make the shape be a square
                .aspectRatio(1.0, contentMode: .fit)

            // Bottom right triangle
            TriangleBottomRight()
                .stroke(.black)
                .fill(.clear)
                // Make the shape be a square
                .aspectRatio(1.0, contentMode: .fit)
        }
        .padding()
    }
}

#Preview {
    TileView()
}
