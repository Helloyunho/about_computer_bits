//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import SwiftUI
import BitsAPI
import PlaygroundSupport

struct NOTGatePage: View {
    @State var byte: UInt8 = 0xFF
    
    var body: some View {
        VStack {
            ByteButtons(byte: $byte)
            Image(systemName: "arrow.down")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 32)
                .foregroundColor(Color.blue)
                .padding()
            ResultByteButtons(byte: ~byte, action: { _ in
                PlaygroundPage.current.navigateTo(page: .next)
            })
            if byte != 0xFF {
                Text("You can navigate to the next page using the green button!")
                    .animation(.easeInOut(duration: 0.2))
            }
        }
    }
}

PlaygroundPage.current.setLiveView(NOTGatePage())
