//
//  TestBindingButton.swift
//  GesturesApp
//
//  Created by Qiwei on 2/1/23.
//

import SwiftUI


// define dimensions
var screen = UIScreen.main.bounds
var screenWidth = screen.width
var screenHeight = screen.height
var wBlock = screen.width / 5
var hBlock = screen.height / 10


var rightPathTop: Path {
    let startPoint = CGPoint(x:wBlock*2, y:hBlock*5)
    let endPoint = CGPoint(x:wBlock*2, y:hBlock*7)
    let ctrlPoint = CGPoint(x:wBlock*5, y:hBlock*6)
    
    let path = UIBezierPath()
    path.move(to: startPoint)
    path.addQuadCurve(to: endPoint, controlPoint: ctrlPoint)
    
    let resultPath = Path(path.cgPath)
    return resultPath
}

var rightPathBottom: Path {
    let startPoint = CGPoint(x:wBlock*2, y:hBlock*7)
    let endPoint = CGPoint(x:wBlock*2, y:hBlock*9)
    let ctrlPoint = CGPoint(x:wBlock*5, y:hBlock*8)
    
    let path = UIBezierPath()
    path.move(to: startPoint)
    path.addQuadCurve(to: endPoint, controlPoint: ctrlPoint)
    
    let resultPath = Path(path.cgPath)
    return resultPath
}

var leftPathTop: Path {
    let endPoint = CGPoint(x:wBlock*3, y:hBlock*4)
    let startPoint = CGPoint(x:wBlock*3, y:hBlock*6)
    let ctrlPoint = CGPoint(x:wBlock*0, y:hBlock*5)
    
    let path = UIBezierPath()
    path.move(to: startPoint)
    path.addQuadCurve(to: endPoint, controlPoint: ctrlPoint)
    
    let resultPath = Path(path.cgPath)
    return resultPath
}

var leftPathBottom: Path {
    let endPoint = CGPoint(x:wBlock*3, y:hBlock*6)
    let startPoint = CGPoint(x:wBlock*3, y:hBlock*8)
    let ctrlPoint = CGPoint(x:wBlock*0, y:hBlock*7)
    
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
    var time : CGFloat
    let path : Path
    let start: CGPoint

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

    }
}

struct SlideButtonsView: View {
    
    @State var isPressed1 = false
    @State var isPressed2 = false
    @State var isPressed3 = false
    @State var isPressed4 = false
    
    
    var body: some View {
        ZStack{
            
            Image("frog")
                .resizable()
                .scaledToFit()
            
            Rectangle()
                .fill(Color.blue)
                .edgesIgnoringSafeArea(.all)
                .opacity(isPressed1 ? 0 : 1) //change to include all 4
            
            
            let topRightStart = CGPoint(x:wBlock*2, y:hBlock*5)
            MyButton(path: rightPathTop, start: topRightStart, isPressed: self.$isPressed1)
            
            let bottomRightStart = CGPoint(x:wBlock*2, y:hBlock*7)
            MyButton(path: rightPathBottom, start: bottomRightStart, isPressed: self.$isPressed2)
            
            let topLeftStart = CGPoint(x:wBlock*3, y:hBlock*6)
            MyButton(path: leftPathTop, start: topLeftStart, isPressed: self.$isPressed3)
            
            let bottomLeftStart = CGPoint(x:wBlock*3, y:hBlock*8)
            MyButton(path: leftPathBottom, start: bottomLeftStart, isPressed: self.$isPressed4)
            
        }
    }
}


struct SlideButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SlideButtonsView()
    }
}
