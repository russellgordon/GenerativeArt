//
//  MosaicView.swift
//  GenerativeArt
//
//  Created by Russell Gordon on 2023-10-24.
//

import SwiftUI

struct MosaicView: View {
    
    var body: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            
            // The number of rows
            ForEach(1..<6) { j in
                
                GridRow {
                    
                    // Repeats within a row (columns)
                    ForEach(1..<4) { i in
                        TileView()
                    }
                }

            }
            
        }
    }
}

#Preview {
    MosaicView()
}
