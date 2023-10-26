//
//  TileView.swift
//  GenerativeArt
//
//  Created by Russell Gordon on 2023-10-24.
//

import SwiftUI

struct TileView: View {
    
    // MARK: Stored properties
    
    // Determine the diagonal (form)
    let flipOne = Coin.tails    // temporary to test colors
    
    // Determine whether top or bottom triangle gets filled with color 1
    let flipTwo = Coin.tails
    
    // Choosing my markers
    let markerOne = Color.red
    let markerTwo = Color.blue
    
    // Decide on colors
    let flipForColor = Coin.heads
    
    // MARK: Computed properties
    
    // Set colors based on the coin flip
    var colorOne: Color {
        return flipForColor == .heads ? markerOne : markerTwo
    }
    var colorTwo: Color {
        return flipForColor == .heads ? markerTwo : markerOne
    }
    
    
    var body: some View {
        ZStack {
        
            if flipOne == .heads {
                // Top right triangle
                TriangleTopRight()
                    .stroke(.black)
                    .fill(flipTwo == .heads ? colorOne : .clear)
                    // Make the shape be a square
                    .aspectRatio(1.0, contentMode: .fit)
                
                // Bottom left triangle
                TriangleBottomLeft()
                    .stroke(.black)
                    .fill(flipTwo == .tails ? colorOne : .clear)
                    // Make the shape be a square
                    .aspectRatio(1.0, contentMode: .fit)

            } else {
             
                // Top left right
                TriangleTopLeft()
                    .stroke(.black)
                    .fill(flipTwo == .heads ? colorOne : .clear)
                    // Make the shape be a square
                    .aspectRatio(1.0, contentMode: .fit)

                // Bottom right triangle
                TriangleBottomRight()
                    .stroke(.black)
                    .fill(flipTwo == .tails ? colorOne : .clear)
                    // Make the shape be a square
                    .aspectRatio(1.0, contentMode: .fit)
                
            }

        }
        .padding()
    }
}

#Preview {
    TileView()
}
