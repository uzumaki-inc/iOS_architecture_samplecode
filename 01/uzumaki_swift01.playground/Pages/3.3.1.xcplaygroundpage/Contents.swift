//: [Previous](@previous)

import UIKit

// 3.3.1 依存関係逆転の原則を適用する

/*
Note:
依存関係逆転の原則とは、
 - 上位レベルのモジュールは下位レベルのモジュールに依存すべきではない。両方とも抽象（abstractions)に依存すべきである。
 - 抽象は詳細に依存してはならない。詳細が抽象に依存すべきである。

是非読んでほしい記事
https://qiita.com/peka2/items/4562456b11163b82feee
 */


class Message {}
class TextMessage {}
class ImageMessage {}

protocol CommonMessageAPIProtocol {
    func fetchAll(ofUserId: Int,
                  completion: @escaping ([Message]?) -> Void)
    func fetch(id: Int,
               completion: @escaping (Message?) -> Void)
    func sendTextMessage(text: String,
                         completion: @escaping (TextMessage?) -> Void)
    func sendImageMessage(image: UIImage, text: String?,
                          completion: @escaping (ImageMessage?) -> Void)
}


class CommonMessageAPI: CommonMessageAPIProtocol {
    func fetchAll(ofUserId: Int, completion: @escaping ([Message]?) -> Void) {
        /* do something */
    }

    func fetch(id: Int, completion: @escaping (Message?) -> Void) {
        /* do something */
    }

    func sendTextMessage(text: String, completion: @escaping (TextMessage?) -> Void) {
        /* do something */
    }

    func sendImageMessage(image: UIImage, text: String?, completion: @escaping (ImageMessage?) -> Void) {
        /* do something */
    }
}

/*
 // 旧
final class MessageSender {
    private let api: CommonMessageAPI
    /*中略*/
    init(messageType: MessageType) {
        self.messageType = messageType
    }
    // 以下省略
}
*/

// 新
final class MessageSender {
    private let api: CommonMessageAPIProtocol
    init(api: CommonMessageAPIProtocol) {
        self.api = api
    }
    // 以下省略
}



/*
MessageSenderAPIProtocolとリネームをすることで、
 fetchAll(ofUserId: completion:)
 fetch(id: completion:)
が実装されていることに違和感がでる

 */
protocol MessageSenderAPIProtocol {
    func fetchAll(ofUserId: Int,
                  completion: @escaping ([Message]?) -> Void)
    func fetch(id: Int,
               completion: @escaping (Message?) -> Void)
    func sendTextMessage(text: String,
                         completion: @escaping (TextMessage?) -> Void)
    func sendImageMessage(image: UIImage, text: String?,
                          completion: @escaping (ImageMessage?) -> Void)
}


//: [Next](@next)
