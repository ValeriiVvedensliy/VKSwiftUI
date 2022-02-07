//
//  BackendError.swift
//  Vk
//
//  Created by Valera Vvedenskiy on 06.02.2022.
//

import Foundation


enum BackendError: Error {
    case friendsError(message: String)
}

extension BackendError: LocalizedError {
    public var friendsError: String? {
        switch self {
        case let .friendsError(message):
            return NSLocalizedString(message, comment: "")
        }
    }
}

enum ApplicationError: Error {
    case loginInputIncorrect(message: String)
}

extension ApplicationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .loginInputIncorrect(message):
            return NSLocalizedString(message, comment: "")
        }
    }
}
