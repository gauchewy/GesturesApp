//
//  ContentView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/19/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
            Image("frog")
                .resizable()
                .scaledToFit()
        }
        //.modifier(content)
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
