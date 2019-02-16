//
//  ChangeColorStore.swift
//  TryFlux
//
//  Created by satoutakeshi on 2019/02/16.
//  Copyright © 2019 Personal Factory. All rights reserved.
//

import Foundation

final class ChangeColorStore: Store {
    static let shared = ChangeColorStore(dispatcher: .shared)

    private(set) var palette: FlatPalette = .default

    override func onDispatch(_ action: Action) {
        switch action {
        case .changeColor(let color):
            palette = color
        }
        emitChange()
    }
}
