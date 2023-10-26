//
//  TileView.swift
//  GenerativeArt
//
//  Created by Russell Gordon on 2023-10-24.
//

import SwiftUI

struct TileView: View {
    
    // MARK: Stored properties
    let flipOne = Coin.heads    // temporary to test colors
    
    // Choosing my markers
    let markerOne = Color.red
    let markerTwo = Color.blue
    
    // Decide on colors
    let flipForColor = Coin.flip()
    
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
                    .fill(colorOne)
                    // Make the shape be a square
                    .aspectRatio(1.0, contentMode: .fit)
                
                // Bottom left triangle
                TriangleBottomLeft()
                    .stroke(.black)
                    .fill(colorTwo)
                    // Make the shape be a square
                    .aspectRatio(1.0, contentMode: .fit)

            } else {
             
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

        }
        .padding()
    }
}

#Preview {
    TileView()
}
