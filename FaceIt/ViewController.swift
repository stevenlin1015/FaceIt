//
//  ViewController.swift
//  FaceIt
//
//  Created by 林松賢 on 2018/1/6.
//  Copyright © 2018年 Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            updateUI()
        }
    }
    
    var expression = FacialExpression(eyes: .closed, mouth: .frown) {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        switch expression.eyes {
        case .open:
            faceView?.eyesOpen = true
        case .closed:
            faceView?.eyesOpen = false
        case .squinting:
            faceView?.eyesOpen = false
        }
        faceView?.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
    }
    
    private let mouthCurvatures = [FacialExpression.Mouth.grin: 0.5,.frown: -1.0,.smile: 1.0,.neutral: 0.0,.smirk: -0.5]

}

