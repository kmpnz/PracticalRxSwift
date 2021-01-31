//
//  LoginError.swift
//  GetReactive
//
//  Created by Andreas Kompanez on 25.01.21.
//

import Foundation

enum LoginError: Error {
    case missingPassword
    case missingUsername
    case wrongCredentials
}
