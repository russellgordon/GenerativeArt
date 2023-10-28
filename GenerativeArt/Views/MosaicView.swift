//
//  MosaicView.swift
//  GenerativeArt
//
//  Created by Russell Gordon on 2023-10-24.
//

import SwiftUI

struct MosaicView: View {
    
    // MARK: Stored properties
    @State var columns = 7.0
    @State var rows = 4
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                
                // The number of rows
                ForEach(0..<rows, id: \.self) { j in
                    
                    GridRow {
                        
                        // Repeats within a row (columns)
                        ForEach(0..<Int(columns), id: \.self) { i in
                            TileView()
                        }
                    }

                }
                
            }
            
            Slider(value: $columns, in: 1...10, step: 1.0)
            
        }
    }
}

#Preview {
    MosaicView()
}
