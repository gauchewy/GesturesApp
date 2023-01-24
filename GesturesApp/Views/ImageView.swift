//
//  ImageView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/23/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        ZStack {
            Image("frog")
                .resizable()
                .scaledToFit()
        }
        .padding()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
