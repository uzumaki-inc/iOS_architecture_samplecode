//
//  FlatPalette.swift
//  TryFlux
//
//  Created by satoutakeshi on 2019/02/15.
//  Copyright © 2019年 Personal Factory. All rights reserved.
//

import UIKit

enum FlatPalette: Int, CaseIterable {

    static let `default` = FlatPalette.turquoise
    case turquoise = 0
    case emerland
    case peterriver
    case alizarin
    case carrot

    var color: UIColor {
        switch self {
        case .turquoise:
            return #colorLiteral(red: 0.1019607843, green: 0.737254902, blue: 0.6117647059, alpha: 1)
        case .emerland:
            return #colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.4431372549, alpha: 1)
        case .peterriver:
            return #colorLiteral(red: 0.2039215686, green: 0.5960784314, blue: 0.8588235294, alpha: 1)
        case .alizarin:
            return #colorLiteral(red: 0.9058823529, green: 0.2980392157, blue: 0.2352941176, alpha: 1)
        case .carrot:
            return #colorLiteral(red: 0.9019607843, green: 0.4941176471, blue: 0.1333333333, alpha: 1)
        }
    }
}
