//
//  String+Extension.swift
//  Big Bite
//
//  Created by Andrey Alymov on 16.09.2021.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
