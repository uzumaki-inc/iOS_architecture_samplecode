# 第5章 MVC

## 参考リンク（書籍から抜粋+α）
- [5章のサンプルコード: GitHub](https://github.com/peaks-cc/iOS_architecture_samplecode/tree/master/05)
- [PresentationDomainSeparation: https://martinfowler.com](https://martinfowler.com/bliki/PresentationDomainSeparation.html)
- デザインパターン関連
    - [増補改訂版Java言語で学ぶデザインパターン入門](https://www.amazon.co.jp/%E5%A2%97%E8%A3%9C%E6%94%B9%E8%A8%82%E7%89%88Java%E8%A8%80%E8%AA%9E%E3%81%A7%E5%AD%A6%E3%81%B6%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3%E5%85%A5%E9%96%80-%E7%B5%90%E5%9F%8E-%E6%B5%A9/dp/4797327030)
    - Swiftのサンプル
        - [Swiftで書くデザインパターンまとめ: 日本語訳](https://qiita.com/susieyy/items/de43bd0a3ceec5c597b9)    
        - Design Patterns implemented in Swift 3.0
            - [Composite](https://github.com/ochococo/Design-Patterns-In-Swift#-composite)
            - [Strategy](https://github.com/ochococo/Design-Patterns-In-Swift#-strategy)
            - [Observer](https://github.com/ochococo/Design-Patterns-In-Swift#-observer)
- Objective-C プログラミングの概念
    - ↑がリンク切れなので代わり↓
    - [Concepts in Objective-C Programming (Model-View-Controller)](https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/Model-View-Controller/Model-View-Controller.html) 
        > View objects and model objects should be the most reusable objects in an application  
 - Swift の時代にあった「新しい MVC」を考える価値
    - デリゲートでは1:Nのデータ通知が難しい。Mulicast Delegateというデザインパターンがある
    - [【デザインパターン】複数にデリゲートする方法 Multicast Delegate Pattern](https://qiita.com/srea/items/590be9d62eb579557b3c)
    - [デザインパターンによる進化的設計 TemplateMethod/Observer/Multicast（メリット・デメリット）](http://objectclub.jp/technicaldoc/pattern/eDWP)
    - [Multicast Delegate and Delegates Composition](http://www.vadimbulavin.com/multicast-delegate/)
    - [jonasman/MulticastDelegate: GitHub](https://github.com/jonasman/MulticastDelegate)

# 第6章 MVP

## 参考リンク（書籍から抜粋+α）
- [6章のサンプルコード: GitHub](https://github.com/peaks-cc/iOS_architecture_samplecode/tree/master/06)
- [Supervising Controller: https://martinfowler.com](https://www.martinfowler.com/eaaDev/SupervisingPresenter.html)
- [Passive View: https://martinfowler.com](https://www.martinfowler.com/eaaDev/PassiveScreen.html)
- [iOS MVP + Clean Architecture Demo: GitHub](https://github.com/FortechRomania/ios-mvp-clean-architecture)
- [MPVサンプルにテストを追加: GitHub](https://github.com/peaks-cc/iOS_architecture_samplecode/blob/master/06/MVPSample/MVPSampleTests/SearchUserPresenterTests.swift)
- VIPER
    - VIPER = Clean Architecture + MVP(Passive View) + Router
    - [iOS Project Architecture : Using VIPER [和訳]](https://qiita.com/YKEI_mrn/items/67735d8ebc9a83fffd29)
    - [Clean Architecture For iOS Development Using The VIPER Pattern](https://medium.com/slalom-engineering/clean-architecture-for-ios-development-using-the-viper-pattern-fac30f5d29fc)
    - [Architecting iOS Apps with VIPER](https://www.objc.io/issues/13-architecture/viper/)
    - [So when to use VIPER, and when not?](https://swifting.io/blog/2016/03/07/8-viper-to-be-or-not-to-be/#sowhentouseviperandwhennot)