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
    let flipOne = Coin.flip()
    
    // Determine whether top or bottom triangle gets filled with color 1
    let flipTwo = Coin.flip()
    
    // Determine the final fill color
    let flipThree = Coin.flip()
    
    // Choosing my markers
    let markerOne = Color(hue: 24.0/360, saturation: 0.74, brightness: 0.78)
    let markerTwo = Color(hue: 200.0/360, saturation: 0.33, brightness: 0.31)
    
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
    
    // Determine fill color for remaining triangle
    var remainingTriangleFillColor: Color {
        if flipThree == .heads {
            return colorTwo
        } else {
            return .clear
        }
    }
    
    
    var body: some View {
        ZStack {
        
            if flipOne == .heads {
                // Top right triangle
                TriangleTopRight()
                    .fill(flipTwo == .heads ? colorOne : remainingTriangleFillColor)
                    .stroke(.black)
                    // Make the shape be a square
                    .aspectRatio(1.0, contentMode: .fit)

                
                // Bottom left triangle
                TriangleBottomLeft()
                    .fill(flipTwo == .tails ? colorOne : remainingTriangleFillColor)
                    .stroke(.black)
                    // Make the shape be a square
                    .aspectRatio(1.0, contentMode: .fit)

            } else {
             
                // Top left right
                TriangleTopLeft()
                    .fill(flipTwo == .heads ? colorOne : remainingTriangleFillColor)
                    .stroke(.black)
                    // Make the shape be a square
                    .aspectRatio(1.0, contentMode: .fit)

                // Bottom right triangle
                TriangleBottomRight()
                    .fill(flipTwo == .tails ? colorOne : remainingTriangleFillColor)
                    .stroke(.black)
                    // Make the shape be a square
                    .aspectRatio(1.0, contentMode: .fit)
                
            }

        }
    }
}

#Preview {
    TileView()
}
