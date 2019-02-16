//
//  ViewController.swift
//  TryFlux
//
//  Created by satoutakeshi on 2019/02/15.
//  Copyright © 2019年 Personal Factory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundView: UIView!

    private let actionCreator: ActionCreator = ActionCreator()
    private let changeColorStore: ChangeColorStore = .shared

    private lazy var reloadSubscription: Subscription = {
        return changeColorStore.addListener {[weak self] in
            self?.backgroundView.backgroundColor =
                self?.changeColorStore.palette.color
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = reloadSubscription
    }
    @IBAction func changeColor(_ sender: Any) {
        guard let currentColor = backgroundView.backgroundColor else {
            return
        }
        actionCreator.changeColor(currentColor: currentColor)
    }
}

/// ボタンタップで背景が変わるアプリを作る
/// 背景色はstringでもっていて、assetで登録したものを呼び出す
/// キャッシュの機構
/// uiのinputの機構
/// 
