//
//  CricleProgressViewController.swift
//  SwiftCustomUI_Example
//
//  Created by ZhangYu on 2019/3/21.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SwiftCustomUI

class CricleProgressViewController: UIViewController {

    @IBOutlet weak var cricleView: CircleProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        cricleView.strokelineWidth = 3
        //里圈颜色
        cricleView.interiorRailwayColor = UIColor.lightGray
        //外圈颜色
        cricleView.exteriorRailwayColor = UIColor.green
        //文字颜色
        cricleView.numbelTextColor = UIColor.red
    }
    
    @IBAction func startBtnClick(_ sender: UIButton) {
         cricleView.circleWithProgress(progress:30, andIsAnimate: true)
    }
}
