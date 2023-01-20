//
//  Title.swift
//  GesturesApp
//
//  Created by Qiwei on 1/19/23.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Peek")
            .bold()
            .font(.title)
            .foregroundColor(.green)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
