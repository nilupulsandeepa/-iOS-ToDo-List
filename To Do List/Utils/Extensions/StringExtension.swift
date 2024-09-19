//
//  StringExtension.swift
//  To Do List
//
//  Created by Nilupul Sandeepa on 2024-09-07.
//

import Foundation

public extension String {
    func localizedString(key: String) -> String {
        return NSLocalizedString(key, comment: self)
    }
}
