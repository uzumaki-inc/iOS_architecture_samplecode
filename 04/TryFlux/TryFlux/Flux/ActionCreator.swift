//
//  ActionCreator.swift
//  TryFlux
//
//  Created by satoutakeshi on 2019/02/16.
//  Copyright © 2019 Personal Factory. All rights reserved.
//

import UIKit

final class ActionCreator {
    private let dispatcher: Dispatcher

    init(dispatcher: Dispatcher = .shared) {
        self.dispatcher = dispatcher
    }
}

// MARK: change color
extension ActionCreator {
    //　処理を書く所
    func changeColor(currentColor: UIColor) {
        let newColor = makeNewColor(current: currentColor)
        dispatcher.dispatch(.changeColor(newColor))
    }

    // 現在のカラーと異なるFlatPaletteを返す。ランダムの結果、現在と同じColorだったらもう一度やり直す。
    private func makeNewColor(current: UIColor) -> FlatPalette {
        let ramdomValue = Int.random(in: 0 ..< FlatPalette.allCases.count)
        guard let ramdomPalette = FlatPalette(rawValue: ramdomValue) else {
            fatalError()
        }
        var newPalette = ramdomPalette
        if current == ramdomPalette.color {
            newPalette = makeNewColor(current: newPalette.color)
        }
        return newPalette
    }
}
