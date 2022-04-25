//
//  ByteButtons.swift
//  BitsAPI
//
//  Created by Helloyunho on 2022/04/19.
//

import SwiftUI

public struct ByteButtons: View {
    @Binding public var byte: UInt8
    @State private var byteInArray: [UInt8] = Array(repeating: 0, count: 8)
    @State private var toChar = false

    public init(byte: Binding<UInt8>) {
        self._byte = byte
    }

    public var body: some View {
        HStack {
            ForEach(0..<8) {
                BitButton(enabled: $byteInArray[$0])
            }
            .animation(.easeInOut(duration: 0.1), value: byte)
            .onAppear {
                for i in 0 ..< 8 {
                    self.byteInArray[i] = (byte >> (7 - i)) & 1
                }
            }
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
        .onChange(of: byteInArray) { newArray in
            var result: UInt8 = 0
            for i in 0 ..< 8 {
                result |= newArray[i] << (7-i)
            }
            byte = result
        }
    }
}
