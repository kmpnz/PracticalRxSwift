//
//  RXLoginViewModel.swift
//  GetReactive
//
//  Created by Andreas Kompanez on 21.01.21.
//

import Foundation
import RxSwift
import RxCocoa

final class RXLoginViewModel: UnidirectionalViewModelType {
    let navigationTitle = "🍊 Fruit Inc. RX Login"

    let tabBarImageName = "fruit-watermelon"

    let tabBarTitle = "RxMVVM"

    struct Input: InputType {
        let username: Observable<String>
        let password: Observable<String>
    }

    struct Output: OutputType {
        let isLoginAllowed: Driver<Bool>
    }

    func configure(input: Input) -> Output {
        let isLoginAllowed = Observable.combineLatest(input.username, input.password) { (username, password) in
            return !username.isEmpty && !password.isEmpty
        }.asDriver(onErrorJustReturn: false)
        return Output(isLoginAllowed: isLoginAllowed)
    }
}
