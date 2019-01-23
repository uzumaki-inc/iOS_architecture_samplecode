import UIKit

// 3.1 設計改善前のコード


// Note: ビルドエラーが出ない程度に最低限補足している
class Message {}
class TextMessage {}
class ImageMessage {}
protocol MessageSenderDelegate  {}
enum MessageType {
    case text
    case image
    case official
}



final class CommonMessageAPI {
    func fetchAll(ofUserId: Int,
                  completion: @escaping ([Message]?) -> Void) { /* do something */ }
    func fetch(id: Int,
               completion: @escaping (Message?) -> Void) { /* do something */ }
    func sendTextMessage(text: String,
                         completion: @escaping (TextMessage?) -> Void) { /* do something */ }
    func sendImageMessage(image: UIImage, text: String?,
                          completion: @escaping (ImageMessage?) -> Void) { /* do something */ }
}



final class MessageSender {
    private let api = CommonMessageAPI()
    let messageType: MessageType
    var delegate: MessageSenderDelegate?

    // MessageType.officialをセットするのは禁止!!
    init(messageType: MessageType) {
        self.messageType = messageType
    }
    // 送信するメッセージの入力値
    var text: String? { /* TextMessage,ImageMessageどちらの場合も使う */
        didSet { if !isTextValid { /* delegate?.validではないことを伝える() */ } }
    }
    var image: UIImage? { /* ImageMessageの場合に使う */
        didSet { if !isImageValid { /*delegate?.validではないことを伝える() */ } }
    }

    // 通信結果
    private(set) var isLoading: Bool = false
    private(set) var result: TextMessage? // 送信成功したら値が入る Memo: 本にはMessageとあるが、それだとエラー。
    private var isTextValid: Bool {
        switch messageType {
        case .text: return text != nil && text!.count <= 300 // 300 字以内
        case .image: return text == nil || text!.count <= 80 // 80 字以内 or nil
        case .official: return false // OfficialMessageはありえない
        }
    }

    private var isImageValid: Bool {
        return image != nil /* imageの場合だけ考慮する */
    }

    private var isValid: Bool {
        switch messageType {
        case .text: return isTextValid
        case .image: return isTextValid && isImageValid
        case .official: return false /* OfficialMessageはありえない */
        }
    }

    func send() {
        guard isValid else { /* delegate?.validではないことを伝える() */ return }
        isLoading = true
        switch messageType {
        case .text:
            api.sendTextMessage(text: text!) { [weak self] in
                self?.isLoading = false
                self?.result = $0
//                self?.delegate?. 通信完了を伝える ()
                }
        case .image:
            api.sendImageMessage(image: image!, text: text) { _ in
                // 中略
//                self?.delegate?. 通信完了を伝える ()
            }
        case .official:
            fatalError()
        }
    }
}
