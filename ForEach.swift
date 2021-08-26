//
//  ForEach.swift
//
//  Created by Adriano Paladini on 20/08/21.
//

import Foundation

public func forEach<T>(_ data: [T], content: @escaping (T) -> Void) {
    data.forEach { item in content(item) }
}

public func forEach(_ data: ClosedRange<Int>, content: @escaping (Int) -> Void) {
    for item in data { content(item) }
}
