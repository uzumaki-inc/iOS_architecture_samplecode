//: [Previous](@previous)

import UIKit

class Message {}
class MessageSenderDelegate {}

protocol MessageInput {
    associatedtype Payload
    func validate() throws -> Payload
}



protocol MessageSenderAPI {
    associatedtype Payload
    associatedtype Response: Message
    func send(payload: Payload, completion: @escaping (Response?) -> Void)
}



final class MessageSender<API: MessageSenderAPI, Input: MessageInput>
where API.Payload == Input.Payload {
    enum State {
        case inputting(validationError: Error?)
        case sending
        case sent(API.Response?)
        case connectionFailed

        init(evaluating input: Input) {
            //Memo: とりあえず決め打ち。。。どうかくのかイメージつかない。なんでinputわたすんだろ？
            self = .inputting(validationError: nil)        }

        mutating func accept(response: API.Response?) {
            //Memo: こんな感じ？なんでacceptメソッドはやしたんだろ？
            self = .sent(response)
        }
    }

    private(set) var state: State {
        didSet { /* delegat?.stateの変化を伝える（） */ }
    }
    let api: API
    var input: Input {
        didSet { state = State(evaluating: input) }
    }
    var delegate: MessageSenderDelegate?
    init(api: API, input: Input) {
        self.api = api
        self.input = input
        self.state = State(evaluating: input)
    }
    func send() {
        do {
            let payload = try self.input.validate()
            self.state = .sending
            api.send(payload: payload) { [weak self] in
                self?.state.accept(response: $0)
            }
        } catch let e {
            state = .inputting(validationError: e)
        }
    }
}


enum TextMessageInputError: Error {
    case tooLongText(count: Int)
}

struct TextMessageInput: MessageInput {
    typealias Payload = String?
    let text: String?

    func validate() throws -> String? {
        if let text = text, text.count >= 50 {
            throw TextMessageInputError.tooLongText(count: text.count)
        }
        return text
    }
}

let textMessageInput = TextMessageInput(text: "hogehoge")


class TextMessageSender: MessageSenderAPI {
    typealias Payload = String?

    typealias Response = Message

    func send(payload: String?, completion: @escaping (Message?) -> Void) {
        // stringのpayloadを使ってsend
        let m = Message()
        completion(m) // メッセージが帰ってきた仮定
    }
}

let textMessageSender = TextMessageSender()


let messageSender = MessageSender(api: textMessageSender, input: textMessageInput)
messageSender.send()



//: [Next](@next)
