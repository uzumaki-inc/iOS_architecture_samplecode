//: [Previous](@previous)

import UIKit


// 3.4.1 インターフェイス分離の原則を適用する

/*
インターフェイス分離の原則

https://qiita.com/UWControl/items/98671f53120ae47ff93a#%E3%82%A4%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%95%E3%82%A7%E3%83%BC%E3%82%B9%E5%88%86%E9%9B%A2%E3%81%AE%E6%B3%95%E5%89%87
(引用)
 「クライアントに、クライアントが利用しないメソッドへの依存を強制してはならない。」
 これは何を指しているのでしょうか。
 簡単に言えば「インターフェースはシンプルにしなさい」と言うことです。
*/

enum SendableMessageType {
    case text
    case image
}




//: [Next](@next)
