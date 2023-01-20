//
//  TestPathCurve.swift
//  GesturesApp
//
//  Created by Qiwei on 1/20/23.
//

import SwiftUI


extension UIBezierPath {
    
    static var quad: UIBezierPath{
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.5, y: 2.0))
        path.addQuadCurve(to: CGPoint(x: 0.5, y: 1.5),
                          controlPoint: CGPoint(x: 1.8, y: 1.8))
        
        return path
    }
}

struct ScaledBezier: Shape {
    let bezierPath: UIBezierPath

    func path(in rect: CGRect) -> Path {
        let path = Path(bezierPath.cgPath)

        // Figure out how much bigger we need to make our path in order for it to fill the available space without clipping.
        let multiplier = min(rect.width, rect.height)

        // Create an affine transform that uses the multiplier for both dimensions equally.
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)

        // Apply that scale and send back the result.
        return path.applying(transform)
    }
}



struct TestPathCurve: View {
    var body: some View {
        ScaledBezier(bezierPath: .quad)
            .stroke(lineWidth: 5)
            .frame(width: 200, height: 200)
        
    }
}

struct TestPathCurve_Previews: PreviewProvider {
    static var previews: some View {
        TestPathCurve()
    }
}
