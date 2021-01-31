//
//  ViewModel.swift
//  GetReactive
//
//  Created by Andreas Kompanez on 21.01.21.
//

import Foundation

protocol ViewModelType {
    var tabBarTitle: String { get }

    var tabBarImageName: String { get }

    var navigationTitle: String { get }
}
