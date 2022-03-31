import UIKit
import Foundation

// 実現したい関数
func sum(a: Int,b: Int) -> Int{
    return a+b
}
// 実行
sum(a: 10,b: 20)

// クロージャ版
let sum2 = {(a: Int,b: Int) -> Int in
    a+b
}
// 実行
sum2(10,10)


// 省略バージョン
let sum3: (Int,Int) -> Int = {
    (a,b) -> Int in
    a+b
}
// 実行
sum3(10,10)

// 別バージョン
let c1 = { () -> Void in
    print("c1")
}
// 実行（()の中身はもちろんないので引数なし)
c1()


let nums = [1,2,3,4,5]

// 実現したい関数
func addValue(nums: [Int], value: Int) -> [Int]{
    var result: [Int] = []
    for num in nums{
        result.append(num+value)
    }
    return result
}
// 実行
addValue(nums: nums, value: 2)

// 問題点: num+valueをnum-valueとかnum*valueとかにするのが面倒
// 引数に1を渡して、1なら+2なら-みたいな感じでif文で分ける方法があるが、冗長で得策ではない
// クロージャを引数に使えば解決！！

// クロージャを引数にした関数 // calc: (Int) -> Int = sum3: (Int,Int) -> Int
func apply(nums: [Int],calc: (Int) -> Int) -> [Int]{
    var result: [Int] = []
    for num in nums {
        result.append(calc(num))
    }
    return result
}

// {(number: Int) -> Int in number*10} = {(a: Int,b: Int) -> Int in a+b}
let r1 = apply(nums: nums, calc: {(number: Int) -> Int in number*10})
// 実行
r1

let r2 = apply(nums: nums, calc: {number in number+10})
r2
