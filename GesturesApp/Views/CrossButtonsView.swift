//
//  CrossButtonsView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/19/23.
//

import SwiftUI


let p1 = CGPoint(x: 100, y: 100)
let p2 = CGPoint(x: 100, y: 500)


var samplePath3: Path {
        let path = UIBezierPath()
        path.move(to: p1)
        path.addQuadCurve(to: p2,
                          controlPoint: CGPoint(x: 500, y: 400))
        
        let resPath = Path(path.cgPath)
        return resPath
}

struct LongPressButtonStyle: ButtonStyle
{
    @Binding var isPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View
    {
        if(configuration.isPressed)
        {
            print("Button is pressed")
            
        }
        else
        {
            print("Button released")
        }
        
        return configuration.label
            .padding()
            .background(configuration.isPressed ? Color.green : Color.red)
            .foregroundColor(.white)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}


struct SlidingSpot : View {
    let path    : Path
    let start   : CGPoint
    let duration: Double = 2

    
    @State private var time : CGFloat = 0
    @State var isPressed = false

    var body: some View {
        
        VStack {
            Button("Press me")
                   {
                       //some action
                   }
                   .buttonStyle(LongPressButtonStyle(isPressed: $isPressed))  //bindings used here successfully
                   .modifier(Moving(time: time, path: path, start: start))
                   .animation(.easeInOut(duration: duration).repeatForever(), value: time)
                   .onAppear {
                       self.time = 1
               }
        }
    }
}


struct Moving: AnimatableModifier {
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


struct CrossButtonsView: View {


    var body: some View {
        
        SlidingSpot(path: samplePath3, start: p1)

    }
}

struct CrossButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CrossButtonsView()
    }
}
