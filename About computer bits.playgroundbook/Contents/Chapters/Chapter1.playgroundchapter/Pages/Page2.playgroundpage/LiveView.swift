//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import SwiftUI
import BitsAPI
import PlaygroundSupport

struct BytesPage: View {
    @State var byte: UInt8 = 0
    
    var body: some View {
        VStack {
            ByteButtons(byte: $byte)
            
            Button(action: {
                PlaygroundPage.current.navigateTo(page: .next)
            }) {
                Label("Go to next page", systemImage: "chevron.forward.circle.fill")
                    .font(.title2)
            }
            .padding()
            .hoverEffect()
        }
    }
}

PlaygroundPage.current.setLiveView(BytesPage())
