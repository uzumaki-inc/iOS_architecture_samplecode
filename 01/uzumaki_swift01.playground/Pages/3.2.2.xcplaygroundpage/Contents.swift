//: [Previous](@previous)

import UIKit

// 3.2.2 単一責任原則をさらに適用する

// Memo: 既存のコードからvalidationを取り出すだけでなく、論理的凝縮を解消する
//       MessageTypeを廃止する。Message種別ごとに必要なバリデーションが違うから、switchするする必要がない

struct ImageMessageInputValidator {
    let image: UIImage?
    let text: String?

    var isValid: Bool {
        if image == nil { return false }
        if let text = text, text.count >= 80 { return false }
        return true
    }
}


struct MessageInputValidator {
    let text: String?

    var isValid: Bool {
        if let text = text, text.count >= 300 { return false }
        return true
    }
}

//: [Next](@next)
