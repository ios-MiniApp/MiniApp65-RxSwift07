//
//  ViewModel.swift
//  MiniApp65-RxSwift07
//
//  Created by 前田航汰 on 2022/07/30.
//

import Foundation
import RxCocoa
import RxSwift

enum CalculateType {
    case plus
    case minus
}

class ViewModel {

    var answer: Observable<String>
    var leftnumber: Observable<String>
    var rightNumber: Observable<String>
    var symbol: Observable<String>
    private var disposeBag = DisposeBag()

    init(oneButton: Observable<Void>,
         twoButton: Observable<Void>,
         threeButton: Observable<Void>,
         fourButton: Observable<Void>,
         fiveButton: Observable<Void>,
         sixButton: Observable<Void>,
         sevenButton: Observable<Void>,
         eightButton: Observable<Void>,
         plussButton: Observable<Void>,
         minusButton: Observable<Void>,
         equalButton: Observable<Void>,
         clearButton: Observable<Void>
    ) {
        var num1: String = ""
        var num2: String = ""
        var calculateType: CalculateType? = nil
        var isLefted: Bool = true

        oneButton.subscribe (onNext: { _ in
            if isLefted {
                num1.append(contentsOf: "1")
            } else {
                num2.append(contentsOf: "1")
            }
        })

        twoButton.subscribe (onNext: { _ in
            if isLefted {
                num1.append(contentsOf: "2")
            } else {
                num2.append(contentsOf: "2")
            }
        })

        threeButton.subscribe (onNext: { _ in
            if isLefted {
                num1.append(contentsOf: "3")
            } else {
                num2.append(contentsOf: "3")
            }
        })

        fourButton.subscribe (onNext: { _ in
            if isLefted {
                num1.append(contentsOf: "4")
            } else {
                num2.append(contentsOf: "4")
            }
        })

        fiveButton.subscribe (onNext: { _ in
            if isLefted {
                num1.append(contentsOf: "5")
            } else {
                num2.append(contentsOf: "5")
            }
        })

        sixButton.subscribe (onNext: { _ in
            if isLefted {
                num1.append(contentsOf: "6")
            } else {
                num2.append(contentsOf: "6")
            }
        })

        sevenButton.subscribe (onNext: { _ in
            if isLefted {
                num1.append(contentsOf: "7")
            } else {
                num2.append(contentsOf: "7")
            }
        })

        eightButton.subscribe (onNext: { _ in
            if isLefted {
                num1.append(contentsOf: "8")
            } else {
                num2.append(contentsOf: "8")
            }
        })

        oneButton.subscribe (onNext: { _ in
            if isLefted {
                num1.append(contentsOf: "9")
            } else {
                num2.append(contentsOf: "9")
            }
        })

        plussButton.subscribe (onNext: { _ in
            calculateType = .plus
            isLefted = false
        })

        minusButton.subscribe (onNext: { _ in
            calculateType = .minus
            isLefted = false
        })

        clearButton.subscribe(onNext: {
            num1 = ""
            num2 = ""
            isLefted = true
            calculateType = nil
        })

        leftnumber = Observable.merge(oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton)
            .map { return num1 }

        rightNumber = Observable.merge(oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton)
            .map { return num2 }

        symbol = Observable.merge(plussButton, minusButton)
            .map{
                guard let calculateType = calculateType else {
                    return ""
                }
                if calculateType == .plus {
                    return "+"
                } else {
                    return "-"
                }
            }

        answer = equalButton.asObservable()
            .map { _ in
                guard let num1 = Int(num1), let num2 = Int(num2), let calculateType = calculateType else {
                    return ""
                }

                if calculateType == .plus {
                    return String(num1 + num2)
                } else {
                    return String(num1 - num2)
                }
            }
    }

}
