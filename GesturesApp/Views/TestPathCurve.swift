//
//  TestPathCurve.swift
//  GesturesApp
//
//  Created by Qiwei on 1/20/23.
//

import SwiftUI


extension UIBezierPath {
    
    static var quadRight: UIBezierPath{
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.25, y: 2.0))
        path.addQuadCurve(to: CGPoint(x: 0.25, y: 1.5),
                          controlPoint: CGPoint(x: 2.5, y: 1.8))
        
        return path
    }
    
    static var quadLeft: UIBezierPath{
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 1.25, y: 1.0))
        path.addQuadCurve(to: CGPoint(x: 0.25, y: 1),
                          controlPoint: CGPoint(x: 0.25, y: 1.8))
        
        return path
    }
}

struct ScaledBezier: Shape {
    let bezierPath: UIBezierPath

    func path(in rect: CGRect) -> Path {
        let path = Path(bezierPath.cgPath)
        let multiplier = min(rect.width, rect.height)
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        return path.applying(transform)
    }
}



struct TestPathCurve: View {
    var body: some View {
        
        ZStack{
            
            ScaledBezier(bezierPath: .quadRight)
                .stroke(lineWidth: 5)
                .frame(width: 300, height: 250)
            
            ScaledBezier(bezierPath: .quadLeft)
                .stroke(lineWidth: 5)
                .frame(width: 300, height: 250)
            
        }
    }
}

struct TestPathCurve_Previews: PreviewProvider {
    static var previews: some View {
        TestPathCurve()
    }
}
