//
//  TestBindingButton.swift
//  GesturesApp
//
//  Created by Qiwei on 2/1/23.
//

import SwiftUI


// define Path
var screen = UIScreen.main.bounds
var screenWidth = screen.width
var screenHeight = screen.height
var wBlock = screen.width / 5
var hBlock = screen.height / 10

var rightPath: Path {
    let startPoint = CGPoint(x:wBlock*2, y:hBlock*7)
    let endPoint = CGPoint(x:wBlock*2, y:hBlock*9)
    let ctrlPoint = CGPoint(x:wBlock*5, y:hBlock*8)
    
    let path = UIBezierPath()
    path.move(to: startPoint)
    path.addQuadCurve(to: endPoint, controlPoint: ctrlPoint)
    
    let resultPath = Path(path.cgPath)
    return resultPath
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

// control Movement
struct Move: AnimatableModifier {
    var time : CGFloat  // Normalized from 0...1.
    let path : Path
    let start: CGPoint  // Could derive from path.

    var animatableData: CGFloat {
        get { time }
        set { time = newValue }
    }

    func body(content: Content) -> some View {
        content
        .position(
            path.trimmedPath(from: 0, to: time).currentPoint ?? start
        )
    }
}

struct MyButton: View{
    let path    : Path
    let start   : CGPoint
    let duration: Double = 2
    
    @State private var time : CGFloat = 0
    @Binding var isPressed:Bool
    
    var body: some View {
        Button("Tap") {
            self.isPressed = true
        }
        .buttonStyle(LongPressButtonStyle2(isPressed: self.$isPressed))
        .modifier(Move(time: time, path: path, start: start))
        .onAppear {
            withAnimation(Animation.easeInOut(duration: self.duration).repeatForever(autoreverses: true)) {
                self.time = 1
            }
        }
        //.animation(.easeInOut(duration: duration).repeatForever(autoreverses: true), value: time)
        
//        .onAppear {
//            self.time = 1
//    }
    }
}

struct SlideButtonsView: View {
    
    @State var isPressed = false
    
    var body: some View {
        ZStack{
            
            Image("frog")
                .resizable()
                .scaledToFit()
            
            Rectangle()
                .fill(Color.blue)
                .edgesIgnoringSafeArea(.all)
                .opacity(self.isPressed ? 0 : 1)
            
            MyButton(path: rightPath, start: p1, isPressed: self.$isPressed)
        }
    }
}


struct SlideButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SlideButtonsView()
    }
}
