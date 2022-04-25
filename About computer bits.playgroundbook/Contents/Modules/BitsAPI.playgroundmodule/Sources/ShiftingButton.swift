//
//  ShiftingButton.swift
//  BitsAPI
//
//  Created by Helloyunho on 2022/04/20.
//

import SwiftUI

public struct ShiftingButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue, alignment: .center)
            .overlay(Color.white.opacity(configuration.isPressed ? 0.3 : 0), alignment: .center)
            .clipShape(Circle())
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

public struct ShiftingButton: View {
    public enum Direction {
        case left
        case right
    }
    
    @Binding public var byte: UInt8
    public var direction: ShiftingButton.Direction

    public init(byte: Binding<UInt8>, direction: ShiftingButton.Direction) {
        self._byte = byte
        self.direction = direction
    }
    
    public var body: some View {
        Button(action: {
            switch (direction) {
            case .left:
                byte <<= 1
            case .right:
                byte >>= 1
            }
        }) {
            switch (direction) {
            case .left:
                Image(systemName: "arrow.left")
            case .right:
                Image(systemName: "arrow.right")
            }
        }
        .buttonStyle(ShiftingButtonStyle())
        .hoverEffect()
    }
}
