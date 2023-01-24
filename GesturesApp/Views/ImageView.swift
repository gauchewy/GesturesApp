//
//  ImageView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/23/23.
//

import SwiftUI

struct ImageView: View {
    @Binding var isPressed: Bool
    
    var body: some View {
        ZStack {
            Image("frog")
                .resizable()
                .scaledToFit()
        
            Rectangle()
                .fill(Color.blue)
                .opacity(isPressed ? 0 : 1)
            
        }
        .padding()
    }
}

struct ImageView_Previews: PreviewProvider {
    @State static var isPressed: Bool = false
    
    static var previews: some View {
        ImageView(isPressed: $isPressed)
    }
}
