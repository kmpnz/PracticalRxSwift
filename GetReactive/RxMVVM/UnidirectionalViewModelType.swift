//
//  UnidirectionalViewModelType.swift
//  GetReactive
//
//  Created by Andreas Kompanez on 25.01.21.
//

import Foundation

protocol InputType {}

protocol OutputType {}

protocol UnidirectionalViewModelType: ViewModelType {
    associatedtype Input: InputType
    associatedtype Output: OutputType

    func configure(input: Input) -> Output
}
