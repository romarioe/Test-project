//
//  Circles.swift
//  KubanTestProject
//
//  Created by Roman Efimov on 19/09/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import Foundation
import UIKit

class Circles{

func drawTrakLayer(center: CGPoint, radius: Int) -> CAShapeLayer{
    let trackLayer = CAShapeLayer()
    let center = center
    
    let circularPath = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
    
    trackLayer.path = circularPath.cgPath
    trackLayer.strokeColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    trackLayer.lineWidth = 3
    trackLayer.fillColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 0)

    return trackLayer
}


    
func drawShapeLayer(center: CGPoint, radius: Int, timeInterval: Double) -> CAShapeLayer{
    let shapeLayer = CAShapeLayer()
    
    let circularPath = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
    
    shapeLayer.path = circularPath.cgPath
    shapeLayer.lineCap = CAShapeLayerLineCap.round
    shapeLayer.strokeColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    shapeLayer.lineWidth = 3
    shapeLayer.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
    shapeLayer.strokeEnd = 0
    
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    basicAnimation.toValue = 1
    basicAnimation.duration = timeInterval
    basicAnimation.fillMode = CAMediaTimingFillMode.forwards
    basicAnimation.isRemovedOnCompletion  = false
    shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    
    return shapeLayer
}
    

}
