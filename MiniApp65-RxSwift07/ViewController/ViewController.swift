//
//  ViewController.swift
//  MiniApp65-RxSwift07
//
//  Created by 前田航汰 on 2022/07/29.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var leftLabel: UILabel!
    @IBOutlet private weak var symbolLabel: UILabel!
    @IBOutlet private weak var rightLabel: UILabel!
    @IBOutlet private weak var answerLabel: UILabel!

    @IBOutlet private weak var oneButton: UIButton!
    @IBOutlet private weak var twoButton: UIButton!
    @IBOutlet private weak var threeButton: UIButton!
    @IBOutlet private weak var fourButton: UIButton!
    @IBOutlet private weak var fiveButton: UIButton!
    @IBOutlet private weak var sixButton: UIButton!
    @IBOutlet private weak var sevenButton: UIButton!
    @IBOutlet private weak var eightButton: UIButton!

    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewModel = ViewModel(
            oneButton: oneButton.rx.tap.asObservable(),
            twoButton: twoButton.rx.tap.asObservable(),
            threeButton: threeButton.rx.tap.asObservable(),
            fourButton: fourButton.rx.tap.asObservable(),
            fiveButton: fiveButton.rx.tap.asObservable(),
            sixButton: sixButton.rx.tap.asObservable(),
            sevenButton: sevenButton.rx.tap.asObservable(),
            eightButton: eightButton.rx.tap.asObservable(),
            plussButton: plusButton.rx.tap.asObservable(),
            minusButton: minusButton.rx.tap.asObservable(),
            equalButton: equalButton.rx.tap.asObservable(),
            clearButton: clearButton.rx.tap.asObservable()
        )

        viewModel.answer
            .bind(to: answerLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.leftnumber
            .bind(to: leftLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.rightNumber
            .bind(to: rightLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.symbol
            .bind(to: symbolLabel.rx.text)
            .disposed(by: disposeBag)

    }


}

