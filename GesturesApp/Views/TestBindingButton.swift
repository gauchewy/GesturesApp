//
//  TestBindingButton.swift
//  GesturesApp
//
//  Created by Qiwei on 2/1/23.
//

import SwiftUI

struct TestBindingButton: View {
    
    @State var isPressed = false
    
    var body: some View {
        ZStack{
            
            Rectangle()
                .fill(Color.blue)
                .opacity(self.isPressed ? 0 : 1)
            
            MyButton(isPressed: self.$isPressed)
        }
    }
}

struct LongPressButtonStyle2: ButtonStyle
{
    @Binding var isPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View
    {
        if(configuration.isPressed)
        {
            self.isPressed = true
            
        }
        else
        {
            self.isPressed = false
                
        }
        
        return configuration.label
            .padding()
            .background(configuration.isPressed ? Color.green : Color.yellow)
            .foregroundColor(.white)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
}

struct MyButton: View{
    
    @Binding var isPressed:Bool
    
    var body: some View {
        Button("Tap") {
            self.isPressed = true
        }
        .buttonStyle(LongPressButtonStyle2(isPressed: self.$isPressed))
    }
}


struct TestBindingButton_Previews: PreviewProvider {
    static var previews: some View {
        TestBindingButton()
    }
}
