//
//  ContentView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressed = false

    var body: some View {
        ZStack {
            Image("frog")
                .resizable()
                .scaledToFit()

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
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
