//
//  BitButton.swift
//  BitsAPI
//
//  Created by Helloyunho on 2022/04/19.
//

import SwiftUI

public struct BitButtonStyle: ButtonStyle {
    public var enabled: UInt8
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(enabled == 1 ? Color.yellow : Color.gray, alignment: .center)
            .overlay(Color.white.opacity(configuration.isPressed ? 0.3 : 0), alignment: .center)
            .clipShape(Circle())
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
            .animation(.easeInOut(duration: 0.2), value: enabled)
    }
}

public struct BitButton: View {
    @Binding public var enabled: UInt8
    public var clickable: Bool
    
    public init(enabled: Binding<UInt8>) {
        self.init(enabled: enabled, clickable: true)
    }
    public init(enabled: Binding<UInt8>, clickable: Bool) {
        self._enabled = enabled
        self.clickable = clickable
    }
    
    public var body: some View {
        Button(action: {
            enabled = enabled ^ 1
        }) {
            Text("")
        }
        .buttonStyle(BitButtonStyle(enabled: enabled))
        .disabled(!clickable)
    }
}
