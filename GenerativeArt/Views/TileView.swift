//
//  TileView.swift
//  GenerativeArt
//
//  Created by Russell Gordon on 2023-10-24.
//

import SwiftUI

// TriangleBottomLeft
struct TriangleBottomLeft: Shape {
    func path(in rect: CGRect) -> Path {
        
        // Make an empty path
        var path = Path()
        
        // Define the path
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY)) // 1
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // 2
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // 3
        
        // Return the path
        return path
        
    }
}

// TriangleTopLeft

// TriangleBottomRight

// TriangleTopRight
struct TriangleTopRight: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        // Make an empty path
        var path = Path()
        
        // Define the path
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // 1
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY)) // 2
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY)) // 3
        
        // Return the path
        return path
        
    }
    
}

struct TileView: View {
    var body: some View {
        VStack {
            // Top right triangle
            TriangleTopRight()
                // Make the shape be a square
                .aspectRatio(1.0, contentMode: .fit)
            
            // Bottom left triangle
            TriangleBottomLeft()
                // Make the shape be a square
                .aspectRatio(1.0, contentMode: .fit)

            
            // Top left right
            
            // Bottom right triangle
        }
        .padding()
    }
}

#Preview {
    TileView()
}
