//
//  Store.swift
//  TryFlux
//
//  Created by satoutakeshi on 2019/02/16.
//  Copyright © 2019 Personal Factory. All rights reserved.
//

import Foundation

typealias Subscription = NSObjectProtocol

// アプリの状態を変更する。使い方はStoreを継承して、そっちを使う
class Store {
    private enum NotificationName {
        static let colorChanged = Notification.Name("color-changed")
    }

    private lazy var dispatchToken: DispatchToken = {
        return dispatcher.register(callback: { [weak self] (action) in
            self?.onDispatch(action)
        })
    }()

    private let dispatcher: Dispatcher
    private let notificationCenter: NotificationCenter

    init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
        self.notificationCenter = NotificationCenter()
        _ = dispatchToken
    }

    func onDispatch(_ action: Action) {
        fatalError("must override")
    }

    final func emitChange() {
        notificationCenter.post(name: NotificationName.colorChanged, object: nil)
    }

    final func addListener(callback: @escaping () -> ()) -> Subscription {
        let using: (Notification) -> () = { notification in
            if notification.name == NotificationName.colorChanged {
                callback()
            }
        }
        return notificationCenter.addObserver(forName: NotificationName.colorChanged,
                                              object: nil,
                                              queue: nil,
                                              using: using)
    }

    final func removeListerner(_ subscription: Subscription) {
        notificationCenter.removeObserver(subscription)
    }
}
