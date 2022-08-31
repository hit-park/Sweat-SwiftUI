//
//  Preview.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/08/31.
//

import SwiftUI

struct Preview<V: View>: View {
    enum Device: String, CaseIterable {
        case iPhone8        = "iPhone 8"
        case iPhone11       = "iPhone 11"
        case iPhone11Pro    = "iPhone 11 Pro"
        case iPhone11ProMax = "iPhone 11 Pro Max"
        case iPhone12mini   = "iPhone 12 mini"
        case iPhone12Pro    = "iPhone 12 Pro"
        case iPhone12ProMax = "iPhone 12 Pro Max"
    }
    
    let source: V
    var devices: [Device] = [.iPhone12mini, .iPhone12Pro, .iPhone11ProMax, .iPhone8]
    var displayDarkMode: Bool = true
    
    var body: some View {
        Group {
            ForEach(devices, id: \.self) {
                self.previewSource(device: $0)
            }
            if !devices.isEmpty && displayDarkMode {
                self.previewSource(device: devices[0])
                    .preferredColorScheme(.dark)
            }
        }
    }
    
    private func previewSource(device: Device) -> some View {
        source
            .previewDevice(PreviewDevice(rawValue: device.rawValue))
            .previewDisplayName(device.rawValue)
    }
    
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Text("Hello, SwiftUI"))
    }
}
