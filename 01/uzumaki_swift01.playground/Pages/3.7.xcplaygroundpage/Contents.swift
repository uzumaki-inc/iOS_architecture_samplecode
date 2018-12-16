//: [Previous](@previous)

import Foundation

// 3.7 Protocol-Oriented Programming

func hoge(xs: [Int] ) { /* do something */ }

hoge(xs: [1, 2, 3])

//hoge(xs: [1, 2, 3].dropFirst())
// ↑ errorが表示される error: cannot convert value of type 'ArraySlice<Int>' to expected argument type '[Int]'


func hoge2<C: Collection>(xs: C) where C.Element == Int { /* do something */ }

hoge2(xs: [1, 2, 3])

hoge2(xs: [1, 2, 3].dropFirst())


//: [Next](@next)
