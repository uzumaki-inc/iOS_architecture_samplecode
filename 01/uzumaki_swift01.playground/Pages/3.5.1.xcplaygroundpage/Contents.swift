//: [Previous](@previous)

import UIKit


// 3.5.1 開放閉鎖原則を適用する

/*
Strategyパターン
https://dev.classmethod.jp/smartphone/ios8-swift-design-pattern-strategy/
*/

class TextMessageSenderAPI {}
class ImageMessageSenderAPI {}
class TextMessageInput {}
class ImageMessageInput {}
class Message{}

enum SendableMessageStrategy {
    case text(api: TextMessageSenderAPI, iput: TextMessageInput)
    case image(api: ImageMessageSenderAPI, input: ImageMessageInput)

    mutating func update(input: Any) {
        // inputを書き換える処理
    }

    func send(completion: @escaping (Message?) -> Void ) {
        // caseごとに通信を行う
    }
}

// Memo: こんな感じなやつをMessageSenderの生成時にConstructor Injection としていれるんだろな
let textSendableMessageStorategy = SendableMessageStrategy.text(api: TextMessageSenderAPI(), iput: TextMessageInput())



final class MessageSender {
    enum State {
        case inputting(validationError: Error?)
        case Sending
        case sent(Message)
        case connectionFailed
    }
}

//: [Next](@next)
