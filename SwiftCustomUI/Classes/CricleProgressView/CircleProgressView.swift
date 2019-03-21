//
//  CircleProgressView.swift
//
//  Created by Nvr on 2018/3/15.
//  Copyright © 2018年 ZY. All rights reserved.
//

import UIKit

public class CircleProgressView: UIView {
    /// 灰色线条的颜色
    @objc public var strokelineWidth:CGFloat = 6.0
    /// 中间字的大小
    @objc public var numbelFont = UIFont.systemFont(ofSize: 18)
    /// 中间字的颜色
    @objc public var numbelTextColor = UIColor.orange
    /// 内部轨道颜色
    @objc public var interiorRailwayColor = UIColor.lightGray
    /// 外部轨道颜色
    @objc public var exteriorRailwayColor = UIColor.orange
    /// label定时器
    public var labelTimer : Timer?
    /// 总的进度
    private var progressValue : CGFloat!
    /// 累加的进度
    private var progressFlag : CGFloat!
    /// 轨道layer
    private lazy var interiorRailwayLayer : CAShapeLayer! = {
        let Layer = CAShapeLayer()
        Layer.strokeColor = UIColor.lightGray.cgColor
        Layer.fillColor = UIColor.clear.cgColor
        Layer.lineCap = CAShapeLayerLineCap.round
        self.layer.addSublayer(Layer)
        return Layer
    }()
    /// 加载轨道layer
    private lazy var exteriorRailwayLayer : CAShapeLayer! = {
        let layerNew = CAShapeLayer()
        layerNew.fillColor = UIColor.clear.cgColor
        layerNew.strokeColor = UIColor.red.cgColor
        //progressLayer.lineCap = kCALineCapRound
        self.layer.addSublayer(layerNew)
        return layerNew
    }()
    
    /// 中间显示数字
    private lazy var numberLabel : UILabel! = {
        let numLabelNew = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        numLabelNew.center = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height/2)
        numLabelNew.backgroundColor = UIColor.clear
        numLabelNew.textAlignment = .center
        self.addSubview(numLabelNew)
        return numLabelNew
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
    }
    
    /**
     调整绘制图像
     
     - parameter progress: 90
     - parameter animate:  true or false
     */
    public func circleWithProgress(progress: CGFloat,andIsAnimate animate : Bool){
        if animate {
            progressFlag = 0
            progressValue = progress
            
            let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height/2), radius: self.bounds.size.width / 2 - strokelineWidth / 2 - 5, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
            self.interiorRailwayLayer.path = path.cgPath
            self.interiorRailwayLayer.lineWidth = strokelineWidth
            self.interiorRailwayLayer.strokeColor = interiorRailwayColor.cgColor
            
            let pathE = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height/2), radius: self.bounds.size.width / 2 - strokelineWidth / 2 - 6, startAngle: -CGFloat(Double.pi * 0.5), endAngle: CGFloat(Double.pi * 1.5), clockwise: true)
            self.exteriorRailwayLayer.path = pathE.cgPath
            self.exteriorRailwayLayer.lineWidth = strokelineWidth + 2
            self.exteriorRailwayLayer.strokeColor = exteriorRailwayColor.cgColor
            
            let pathAnima = CABasicAnimation(keyPath: "strokeEnd")
            pathAnima.duration = Double(progress / 100.0)
            pathAnima.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            pathAnima.fromValue = NSNumber(value: 0)
            pathAnima.toValue = NSNumber(value: Float(progress / 100.0))
            pathAnima.fillMode = CAMediaTimingFillMode.forwards
            pathAnima.isRemovedOnCompletion = false
            self.exteriorRailwayLayer.add(pathAnima, forKey: "strokeEndAnimation")
            
            self.numberLabel.font = numbelFont
            self.numberLabel.textColor = numbelTextColor
            if progress > 0 {
                labelTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(CircleProgressView.nameLbChange), userInfo: nil, repeats: true)
            }
        }else{
            self.numberLabel.text = "\(Int(progress))%"
            self.numberLabel.font = numbelFont
            self.numberLabel.textColor = numbelTextColor
            
            let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height/2), radius: self.bounds.size.width / 2 - strokelineWidth / 2 - 5, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
            self.interiorRailwayLayer.path = path.cgPath
            self.interiorRailwayLayer.lineWidth = strokelineWidth
            self.interiorRailwayLayer.strokeColor = interiorRailwayColor.cgColor
            
            let pathE = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height/2), radius: self.bounds.size.width / 2 - strokelineWidth / 2 - 6, startAngle: -CGFloat(Double.pi * 0.5), endAngle: CGFloat(Double.pi * 1.5), clockwise: true)
            self.exteriorRailwayLayer.path = pathE.cgPath
            self.exteriorRailwayLayer.lineWidth = strokelineWidth + 2
            self.exteriorRailwayLayer.strokeColor = exteriorRailwayColor.cgColor
            self.exteriorRailwayLayer.strokeEnd = progress / 100.0
        }
    }
    
    /**
     定时器走的方法
     */
    @objc public func nameLbChange(){
        if(progressFlag >= progressValue - 1){
            labelTimer!.invalidate()
            labelTimer = nil
        }
        progressFlag! += CGFloat(1.0)
        numberLabel.text = "\(Int(progressFlag))%"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
