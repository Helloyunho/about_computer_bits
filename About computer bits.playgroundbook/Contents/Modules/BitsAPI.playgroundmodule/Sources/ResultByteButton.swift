//
//  ResultBitButton.swift
//  BitsAPI
//
//  Created by Helloyunho on 2022/04/19.
//

import SwiftUI

public struct ResultByteButtons: View {
    public var byte: UInt8
    private var byteInArray: [UInt8] = Array(repeating: 0, count: 8)
    private var action: (UInt8) -> Void
    public var clickable: Bool
    @State private var toChar = false
    
    public init(byte: UInt8) {
        self.init(byte: byte, action: {_ in }, clickable: false)
    }
    
    public init(byte: UInt8, action: @escaping (UInt8) -> Void) {
        self.init(byte: byte, action: action, clickable: true)
    }

    public init(byte: UInt8, action: @escaping (UInt8) -> Void, clickable: Bool) {
        self.byte = byte
        for i in 0 ..< 8 {
            self.byteInArray[i] = (byte >> (7 - i)) & 1
        }
        self.action = action
        self.clickable = clickable
    }

    public var body: some View {
        HStack {
            ForEach(0..<8) {
                ResultBitButton(enabled: byteInArray[$0], action: action, clickable: clickable && byteInArray[$0] == 1)
            }
            .animation(.easeInOut(duration: 0.1), value: byte)
            Group {
                if toChar {
                    Text("\(String(decoding: [byte], as: UTF8.self))")
                } else {
                    Text("\(byte)")
                }
            }.onTapGesture {
                toChar.toggle()
            }
        }
    }
}
