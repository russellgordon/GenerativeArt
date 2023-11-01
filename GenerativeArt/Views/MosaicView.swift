//
//  MosaicView.swift
//  GenerativeArt
//
//  Created by Russell Gordon on 2023-10-24.
//

import SwiftUI

struct MosaicView: View {
    
    // MARK: Stored properties
    @State var columns = 20.0
    @State var rows = 10.0
    
    @State var linkToPDF: URL?
    
    var mosaic: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            
            // The number of rows
            ForEach(0..<Int(rows), id: \.self) { j in
                
                GridRow {
                    
                    // Repeats within a row (columns)
                    ForEach(0..<Int(columns), id: \.self) { i in
                        TileView()
                    }
                }

            }
            
        }
        .background(.white)
    }
    
    // MARK: Computed properties
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            mosaic
            
            Spacer()
            
            Slider(value: $columns, in: 1...30, step: 1.0)
            Slider(value: $rows, in: 1...30, step: 1.0)
            
            Button(action: {
                linkToPDF = self.renderToPDF(contentToRender: mosaic, filename: "hellokitty")
            }) {
                Text("Save to PDF")
            }
            
            Link(destination: linkToPDF ?? URL(string: "https://www.apple.com")!, label: {
                Text(linkToPDF?.description ?? "")
            })
            .opacity(linkToPDF == nil ? 0.0 : 1.0)

        }
        .padding()
    }
}

#Preview {
    MosaicView()
}
