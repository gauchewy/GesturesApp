//
//  WrapperView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/23/23.
//

import SwiftUI

struct WrapperView<Content: View>: View {
    var content: Content
    
    var body: some View {
        ZStack {
            
            ImageView()
            
            content
        }
    }
}

struct WrapperView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            WrapperView(content: CrossButtonsView())
        }
    }
}
