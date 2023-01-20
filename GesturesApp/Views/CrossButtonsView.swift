//
//  CrossButtonsView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/19/23.
//

import SwiftUI

// Pick a simple example path.
fileprivate let W = UIScreen.main.bounds.width
fileprivate let H = UIScreen.main.bounds.height

fileprivate let p1 = CGPoint(x: 50, y: H - 50)
fileprivate let p2 = CGPoint(x: W - 50, y: 50)

fileprivate var samplePath : Path {
    let c1 = CGPoint(x: p1.x, y: (p1.y + p2.y)/2)
    let c2 = CGPoint(x: p2.x, y: (p1.y + p2.y)/2)

    var result = Path()
    result.move(to: p1)
    result.addCurve(to: p2, control1: c1, control2: c2)
    return result
}

// This View's position follows the Path.
struct SlidingSpot : View {
    let path    : Path
    let start   : CGPoint
    let duration: Double = 1

    @State var isMovingForward = false

    var tMax : CGFloat { isMovingForward ? 1 : 0 }  // Same expressions,
    var opac : Double  { isMovingForward ? 1 : 0 }  // different meanings.

    var body: some View {
        VStack {
            Circle()
            .frame(width: 30)

            // Asperi is correct that this Modifier must be separate.
            .modifier(Moving(time: tMax, path: path, start: start))

            .animation(.easeInOut(duration: duration), value: tMax)
            .opacity(opac)

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
        
        SlidingSpot(path: samplePath, start: p1)
    }
}

struct CrossButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CrossButtonsView()
    }
}
