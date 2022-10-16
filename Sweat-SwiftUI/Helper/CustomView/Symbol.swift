//
//  Symbol.swift
//  Sweat-SwiftUI
//
//  Created by 희태 박 on 2022/10/14.
//

import SwiftUI

struct Symbol: View {
    
    let systemName  : String
    let imageScale  : Image.Scale
    let color       : Color?
    
    init(
        _ systemName: String,
        imageScale  : Image.Scale = .medium,
        color       : Color?
    ) {
        self.systemName = systemName
        self.imageScale = imageScale
        self.color      = color
    }
    
    var body: some View {
        Image(systemName: systemName)
            .imageScale(imageScale)
            .foregroundColor(color)
    }
}
