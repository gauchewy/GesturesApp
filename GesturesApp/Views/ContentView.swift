//
//  ContentView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("frog")
                .resizable()
                .scaledToFit()

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
