//
//  SpotlightView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/20/23.
//

import SwiftUI

struct SpotlightView: ViewModifier {
    
    @State private var isPressed = false
    
    func body(content:Content) -> some View {
        ZStack{
            content
            Rectangle()
                .fill(Color.black)
                .opacity(isPressed ? 0.2 : 1)
                .gesture(
                    LongPressGesture(minimumDuration: 0.1)
                        .onEnded{ _ in
                            self.isPressed.toggle()
                        }
                )
        }
    }
    
}
