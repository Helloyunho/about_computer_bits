//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import SwiftUI
import BitsAPI
import PlaygroundSupport

struct ShiftingPage: View {
    @State var byte: UInt8 = 0b00101101
    
    var body: some View {
        HStack {
            ShiftingButton(byte: $byte, direction: .left)
            ResultByteButtons(byte: byte, action: { _ in
                PlaygroundPage.current.navigateTo(page: .next)
            }, clickable: byte == 180)
            ShiftingButton(byte: $byte, direction: .right)
        }
    }
}

PlaygroundPage.current.setLiveView(ShiftingPage())
