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
struct TriangleTopLeft: Shape {
    
    // On iOS, the co-ordinate system is flipped
    // Origin at upper left and positive values on vertical axis extend downward
    func path(in rect: CGRect) -> Path {
        
        // Make an empty path
        var path = Path()
        
        // Draw the path
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))   // 1
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))   // 2
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))   // 3
        
        // Return the path
        return path
    }
    
}

// TriangleBottomRight
struct TriangleBottomRight: Shape {
    
    // On iOS, the co-ordinate system is flipped
    // Origin at upper left and positive values on vertical axis extend downward
    func path(in rect: CGRect) -> Path {
        
        // Make an empty path
        var path = Path()
        
        // Draw the path
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))      // 1
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))   // 2
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))   // 3
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))   // 4
        
        // Return the path
        return path
    }
    
}

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
