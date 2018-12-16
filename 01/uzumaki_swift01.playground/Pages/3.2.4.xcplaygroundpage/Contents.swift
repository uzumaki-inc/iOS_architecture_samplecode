//: [Previous](@previous)

import UIKit

// 3.2.4 「失敗の可能性がある処理」の表現


// Note: 失敗を表現することを検討
//       是非読んでほしい記事 https://qiita.com/koher/items/a7a12e7e18d2bb7d8c77


    
// ImageMessageInput.swift

enum ImageMessageInputError: Error {
    case noImage
    case tooLongText(count: Int)
}

struct ImageMessageInput {
    let image: UIImage?
    let text: String?

    func validate() throws -> (image: UIImage, text: String?) {
        guard let image = image else {
            throw ImageMessageInputError.noImage
        }

        if let text = text, text.count >= 80 {
            throw ImageMessageInputError.tooLongText(count: text.count)
        }
        return (image, text)
    }
}


enum MessageInputError: Error {
    // Memo: caseが１つでも、失敗を理由が分かる形で表現してるのでこれでいいと思う
    case tooLongText(count: Int)
}

struct MessageInput {
    let text: String?

    func validate() throws -> String? {

        if let text = text, text.count >= 8 {
            throw MessageInputError.tooLongText(count: text.count)
        }
        return text
    }
}


let messageInput = MessageInput(text: "unkounkounkounkounko")

do {
    _ = try messageInput.validate()
    // messageを使う処理
} catch MessageInputError.tooLongText(let count){
    print("入力した文字数は、\(count)文字です。長過ぎるのでだめです。")
}

//: [Next](@next)
