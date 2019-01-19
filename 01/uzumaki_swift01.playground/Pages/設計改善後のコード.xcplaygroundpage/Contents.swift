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

        init(evaluating input: Input) { self = .sending /* Memo: エラーおきるから適当にいれた */ }

        mutating func accept(response: API.Response?) { /* do something */ }
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


//: [Next](@next)
