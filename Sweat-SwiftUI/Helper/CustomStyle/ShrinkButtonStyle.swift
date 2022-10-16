//
//  ShrinkButtonStyle.swift
//  Sweat-SwiftUI
//
//  Created by 희태 박 on 2022/10/14.
//

import SwiftUI

struct ShrinkButtonStyle: ButtonStyle {
    
    var minScale    : CGFloat = 0.9
    var minOpacity  : Double  = 0.6
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? minScale : 1)
            .opacity(configuration.isPressed ? minOpacity : 1)
    }
}
