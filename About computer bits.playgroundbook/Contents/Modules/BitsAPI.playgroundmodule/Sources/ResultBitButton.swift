//
//  ResultBitButton.swift
//  BitsAPI
//
//  Created by Helloyunho on 2022/04/19.
//

import SwiftUI

public struct ResultButtonStyle: ButtonStyle {
    public var enabled: UInt8

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(enabled == 1 ? Color.green : Color(red: 0.3, green: 0.3, blue: 0.3), alignment: .center)
            .overlay(Color.white.opacity(configuration.isPressed ? 0.3 : 0), alignment: .center)
            .clipShape(Circle())
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
            .animation(.easeInOut(duration: 0.2), value: enabled)
    }
}

public struct ResultBitButton: View {
    public var enabled: UInt8
    private var action: (UInt8) -> Void
    public var clickable: Bool

    public init(enabled: UInt8) {
        self.init(enabled: enabled, action: {_ in }, clickable: false)
    }
    
    public init(enabled: UInt8, action: @escaping (UInt8) -> Void) {
        self.init(enabled: enabled, action: action, clickable: true)
    }
    
    public init(enabled: UInt8, action: @escaping (UInt8) -> Void, clickable: Bool) {
        self.enabled = enabled
        self.action = action
        self.clickable = clickable
    }

    public var body: some View {
        Button(action: {
            self.action(enabled)
        }) {
            Text("")
        }
        .buttonStyle(ResultButtonStyle(enabled: enabled))
        .disabled(!clickable)
    }
}
