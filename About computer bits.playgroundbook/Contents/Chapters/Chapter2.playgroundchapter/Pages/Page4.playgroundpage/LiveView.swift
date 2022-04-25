//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import SwiftUI
import BitsAPI
import PlaygroundSupport

struct XORGatePage: View {
    @State var byte1: UInt8 = 0
    @State var byte2: UInt8 = 0
    
    var body: some View {
        VStack {
            ByteButtons(byte: $byte1)
            ByteButtons(byte: $byte2)
            Image(systemName: "arrow.down")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 32)
                .foregroundColor(Color.blue)
                .padding()
            ResultByteButtons(byte: byte1 ^ byte2, action: { _ in
                PlaygroundPage.current.navigateTo(page: .next)
            }, clickable: byte1 ^ byte2 == 42)
        }
    }
}

PlaygroundPage.current.setLiveView(XORGatePage())
