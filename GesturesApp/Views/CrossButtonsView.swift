//
//  CrossButtonsView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/19/23.
//

import SwiftUI


let p1 = CGPoint(x: 300, y: 300)
let p2 = CGPoint(x: 300, y: 500)

fileprivate var samplePath3: Path {
        let path = UIBezierPath()
        path.move(to: p1)
        path.addQuadCurve(to: p2,
                          controlPoint: CGPoint(x: 500, y: 400))
        
        let resPath = Path(path.cgPath)
        return resPath
}

struct SlidingSpot : View {
    let path    : Path
    let start   : CGPoint
    let duration: Double = 2

    @State var isMovingForward = false
    @State var isPressed = false
    @GestureState var currPress = false

    var tMax : CGFloat { isMovingForward ? 1 : 0 }

    var body: some View {
        VStack {
            Button(action:{
                //action
            }){
                Circle()
                    .frame(width: 50)
                    .overlay(
                        Circle()
                            .fill(Color.green)
                            .opacity(isPressed ? 1 : 0)
                    )
                    .modifier(Moving(time: tMax, path: path, start: start))
                    .animation(.easeInOut(duration: duration).repeatForever(), value: tMax)
                    .onLongPressGesture{
                        isPressed = true
                    } onPressingChanged: { inProgress in
                        isPressed = false
                    }
            }
            
            Button {
                isMovingForward = true

                // Sneak back to p1. This is a code smell.
                DispatchQueue.main.asyncAfter(deadline: .now() + duration + 0.1) {
                    isMovingForward = false
                }
            } label: {
                Text("Go")
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
