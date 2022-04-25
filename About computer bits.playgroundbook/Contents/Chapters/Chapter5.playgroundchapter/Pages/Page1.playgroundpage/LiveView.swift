//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import SwiftUI
import BitsAPI
import PlaygroundSupport

enum Gates: String, CaseIterable, Identifiable {
    case not = "NOT Gate"
    case and = "AND Gate"
    case or = "OR Gate"
    case xor = "XOR Gate"
    case nand = "NAND Gate"
    case nor = "NOR Gate"
    case xnor = "XNOR Gate"
    case shifting = "Shifting Mode"
    
    var id: String { self.rawValue }
}

struct SmallPlayground: View {
    @State var byte1: UInt8 = 0xFF
    @State var byte2: UInt8 = 0
    @State var result: UInt8 = 0
    @State var bytes: [UInt8] = []
    @State var selectedGate: Gates = .not
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedGate) {
                ForEach(Gates.allCases) { gate in
                    Text(gate.rawValue).tag(gate)
                }
            }
            .pickerStyle(.menu)
            if selectedGate != .shifting {
                ByteButtons(byte: $byte1)
                if selectedGate != .not {
                    ByteButtons(byte: $byte2)
                }
                Image(systemName: "arrow.down")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 32)
                    .foregroundColor(Color.blue)
                    .padding()
            }
            HStack {
                if selectedGate == .shifting {
                    ShiftingButton(byte: $result, direction: .left)
                }
                ResultByteButtons(byte: result)
                if selectedGate == .shifting {
                    ShiftingButton(byte: $result, direction: .right)
                }
            }
            Button(action: {
                bytes.append(result)
            }) {
                Label("Append a letter", systemImage: "plus.circle.fill")
                    .font(.title2)
            }
            .padding()
            .hoverEffect()
            HStack {
                Text("\(String(decoding: bytes, as: UTF8.self))")
                if !bytes.isEmpty {
                    Button(action: {
                        bytes.removeLast()
                    }) {
                        Image(systemName: "delete.left.fill")
                    }
                    .hoverEffect()
                }
            }
        }
        .onChange(of: byte1, perform: {_ in calculate()})
        .onChange(of: byte2, perform: {_ in calculate()})
        .onChange(of: selectedGate, perform: {_ in calculate()})
    }
    
    func calculate() -> UInt8 {
        switch(selectedGate) {
        case .not:
            result = ~byte1
        case .and:
            result = byte1 & byte2
        case .or:
            result = byte1 | byte2
        case .xor:
            result = byte1 ^ byte2
        case .nand:
            result = ~(byte1 & byte2)
        case .nor:
            result = ~(byte1 | byte2)
        case .xnor:
            result = ~(byte1 ^ byte2)
        case .shifting:
            break
        }
        return result
    }
}

PlaygroundPage.current.setLiveView(SmallPlayground())
