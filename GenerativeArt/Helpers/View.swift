//
//  View.swift
//  GenerativeArt
//
//  Created by Russell Gordon on 2023-10-31.
//

import SwiftUI

// NOTE: Adapted from...
//
// 1. Paul Hudson
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-render-a-swiftui-view-to-a-pdf
//
// 2. Chris Eidhof
// https://m.objc.io/@chris/109643040580330028
//
extension View {
    
    // A view renders itself as a PDF
    // Returns: A URL leading to the PDF file containing the result.
    @MainActor
    func renderToPDF(contentToRender: some View, filename: String) -> URL {
        
        // 1. Save all of this to our Documents directory
        let url = URL.documentsDirectory.appending(path: "\(filename).pdf")
        
        // 2. Prepare the renderer
        //
        // Limit size of view using .frame so that the view
        // doesn't expand too much, making text small
        let renderer = ImageRenderer(content:
                                        contentToRender
                                        .frame(width: 500)
        )
        
        // 3. Start the rendering process
        renderer.render { size, context in
            
            // 4. Tell SwiftUI our PDF should be the given size
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            
            // 5. Create the CGContext for our PDF pages
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
                return
            }
            
            // 6: Start a new PDF page
            pdf.beginPDFPage(nil)
            
            // 7: Render the SwiftUI view data onto the page
            context(pdf)
            
            // 8: End the page and close the file
            pdf.endPDFPage()
            pdf.closePDF()
        }
        
        return url
        
    }
}

