//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import SwiftUI
import BitsAPI
import PlaygroundSupport

struct StartPage: View {
    @State var bit: UInt8 = 0
    
    var body: some View {
        VStack {
            BitButton(enabled: $bit)
            if bit == 1 {
                Text("You just enabled one bit!")
                    .font(.title2)
                    .animation(Animation.easeInOut(duration: 0.2))
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
}

PlaygroundPage.current.setLiveView(StartPage())
