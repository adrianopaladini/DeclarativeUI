//
//  ArrayBuilder.swift
//
//  Created by Adriano Paladini on 20/08/21.
//

import Foundation


@resultBuilder
public struct CustomArrayBuilder<T> {
    // Empty Case
    public static func buildBlock() -> [T] { [] }
    // Single case
    public static func buildBlock(_ expression: T) -> [T] { [expression] }
    // Multple items
    public static func buildBlock(_ elements: T...) -> [T] { elements }
    // Multiple function builders
    public static func buildBlock(_ elementss: [T]...) -> [T] { elementss.flatMap({ $0 }) }
    // If/Else
    public static func buildBlock(_ elements: [T]) -> [T] { elements }
    public static func buildEither(first: [T]) -> [T] { first }
    public static func buildEither(second: [T]) -> [T] { second }
    // Just ifs
    public static func buildIf(_ element: [T]?) -> [T] { element ?? [] }
    // fatalError()
    public static func buildBlock(_ element: Never) -> [T] {}

    // Mix Arrays and Singles.
    // But this is a work around for "A parameter following a variadic parameter requires a label"

    // 1x Arrays (up to 3x singles)
    public static func buildBlock(_ array1: [T], _ trailing: T...) -> [T] { array1 + trailing }
    public static func buildBlock(_ e1: T, _ array1: [T], _ trailing: T...) -> [T] { [e1] + array1 + trailing }
    public static func buildBlock(_ e1: T, _ e2: T, _ array1: [T], _ trailing: T...) -> [T] { [e1, e2] + array1 + trailing }
    public static func buildBlock(_ e1: T, _ e2: T, _ e3: T, _ array1: [T], _ trailing: T...) -> [T] { [e1, e2, e3] + array1 + trailing }

    // 2x Arrays (up to 3x singles)
    public static func buildBlock(_ array1: [T], _ array2: [T], _ e1: T, _ trailing: T...) -> [T] { array1 + array2 + [e1] + trailing } // to avoid ambiguity ([T]...)
    public static func buildBlock(_ array1: [T], _ e1: T, _ array2: [T], _ trailing: T...) -> [T] { array1 + [e1] + array2 + trailing }
    public static func buildBlock(_ e1: T, _ array1: [T], _ array2: [T], _ trailing: T...) -> [T] { [e1] + array1 + array2 + trailing }

    public static func buildBlock(_ array1: [T], _ e1: T, _ e2: T, _ array2: [T], _ trailing: T...) -> [T] { array1 + [e1, e2] + array2 + trailing }
    public static func buildBlock(_ e1: T, _ array1: [T], _ e2: T, _ array2: [T], _ trailing: T...) -> [T] { [e1] + array1 + [e2] + array2 + trailing }
    public static func buildBlock(_ e1: T, _ e2: T, _ array1: [T], _ array2: [T], _ trailing: T...) -> [T] { [e1, e2] + array1 + array2 + trailing }

    public static func buildBlock(_ array1: [T], _ e1: T, _ e2: T, _ e3: T, _ array2: [T], _ trailing: T...) -> [T] { array1 + [e1, e2, e3] + array2 + trailing }
    public static func buildBlock(_ e1: T, _ array1: [T], _ e2: T, _ e3: T, _ array2: [T], _ trailing: T...) -> [T] { [e1] + array1 + [e2, e3] + array2 + trailing }
    public static func buildBlock(_ e1: T, _ e2: T, _ array1: [T], _ e3: T, _ array2: [T], _ trailing: T...) -> [T] { [e1, e2] + array1 + [e3] + array2 + trailing }
    public static func buildBlock(_ e1: T, _ e2: T, _ e3: T, _ array1: [T], _ array2: [T], _ trailing: T...) -> [T] { [e1, e2, e3] + array1 + array2 + trailing }
}
