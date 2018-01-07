//
//  FacialExpression.swift
//  FaceIt
//
//  Created by 林松賢 on 2018/1/7.
//  Copyright © 2018年 Steven. All rights reserved.
//

import Foundation

//UI-independent representation of a facial expression

struct FacialExpression {
    enum Eyes: Int {
        case open
        case closed
        case squinting
    }
    
    enum Mouth: Int {
        case frown //皺眉
        case smirk //嘻嘻笑
        case neutral //中立
        case grin //露齒而笑
        case smile //微笑
        
        var sadder: Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .frown
        }
        var happier: Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .smile
        }
    }
    
    var sadder: FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.sadder)
    }
    var happier: FacialExpression {
        return FacialExpression(eyes: self.eyes, mouth: self.mouth.happier)
    }
    
    let eyes: Eyes
    let mouth: Mouth
}
