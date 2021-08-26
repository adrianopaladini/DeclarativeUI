//
//  Color.swift
//
//  Created by Adriano Paladini on 17/08/21.
//

import UIKit

public class Color: NSObject {

    private var object = UIColor()

    public var cgColor: CGColor {
        return object.cgColor
    }

    public var uiColor: UIColor {
        return object
    }

    @discardableResult
    public convenience init(_ named: String) {
        self.init()
        object = UIColor(named: named) ?? .clear
    }

    @discardableResult
    public convenience init(_ named: String, bundle: Bundle) {
        self.init()
        object = UIColor(named: named, in: bundle, compatibleWith: nil)  ?? .clear
    }

    @discardableResult
    public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init()
        object = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

    @discardableResult
    public convenience init(white: CGFloat) {
        self.init()
        object = UIColor(white: white, alpha: 1)
    }

    @discardableResult
    public convenience init(hex: String) {
        self.init()
        object = hexStringToUIColor(hex: hex)
    }

    @discardableResult
    public func opacity(_ alpha: CGFloat) -> Self {
        object = object.withAlphaComponent(alpha)
        return self
    }

    @discardableResult
    public func named(_ named: String) -> Self {
        object = UIColor(named: named) ?? .clear
        return self
    }

    @discardableResult
    public func named(_ named: String, bundle: Bundle) -> Self {
        object = UIColor(named: named, in: bundle, compatibleWith: nil) ?? .clear
        return self
    }

    @discardableResult
    public func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> Self {
        object = UIColor(red: red, green: green, blue: blue, alpha: 1)
        return self
    }

    @discardableResult
    public func white(_ white: CGFloat) -> Self {
        object = UIColor(white: white, alpha: 1)
        return self
    }

    @discardableResult
    public func hex(_ hex: String) -> Self {
        object = hexStringToUIColor(hex: hex)
        return self
    }

    private func hexStringToUIColor(hex: String) -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1

        let hexColor = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
            if hexColor.count == 8 {
                red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                alpha = CGFloat(hexNumber & 0x000000ff) / 255
                return UIColor(red: red, green: green, blue: blue, alpha: alpha)
            } else if hexColor.count == 6 {
                red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                blue = CGFloat(hexNumber & 0x0000ff) / 255
                return UIColor(red: red, green: green, blue: blue, alpha: 1)
            }
        }
        return UIColor.black
    }
}

extension Color {
    public static let clear: Color = Color(white: 1).opacity(0)

    public static let red: Color = Color(red: 1, green: 0, blue: 0)
    public static let green: Color = Color(red: 0, green: 1, blue: 0)
    public static let blue: Color = Color(red: 0, green: 0, blue: 1)

    public static let black: Color = Color(white: 0)
    public static let white: Color = Color(white: 1)

    public static let gray: Color = Color(red: 0.56, green: 0.56, blue: 0.58)
    public static let darkGray: Color  = Color(red: 0.33, green: 0.33, blue: 0.33)
    public static let lightGray: Color = Color(red: 0.67, green: 0.67, blue: 0.67)

    public static let cyan: Color = Color(red: 0.33, green: 1.00, blue: 1.00)
    public static let magenta: Color = Color(red: 0.96, green: 0.00, blue: 1.00)
    public static let brown: Color = Color(red: 0.60, green: 0.40, blue: 0.20)
    public static let orange: Color = Color(red: 0.97, green: 0.58, blue: 0.00)
    public static let yellow: Color = Color(red: 0.98, green: 0.80, blue: 0.01)
    public static let purple: Color = Color(red: 0.69, green: 0.32, blue: 0.87)
    public static let pink: Color = Color(red: 1.00, green: 0.17, blue: 0.33)

    public static let lightText: Color = Color(white: 1)
    public static let darkText: Color = Color(white: 0)

    public static let primary: Color = Color(red: 0.20, green: 0.20, blue: 0.20)
    public static let secondary: Color = Color(red: 0.54, green: 0.54, blue: 0.55)

    public static let systemRed: Color = Color(red: 0.96, green: 0.23, blue: 0.19)
    public static let systemGreen: Color = Color(red: 0.24, green: 0.78, blue: 0.35)
    public static let systemBlue: Color = Color(red: 0.19, green: 0.48, blue: 1.00)
    public static let systemOrange: Color = Color(red: 0.97, green: 0.58, blue: 0.00)
    public static let systemYellow: Color = Color(red: 0.98, green: 0.80, blue: 0.01)
    public static let systemPink: Color = Color(red: 0.96, green: 0.18, blue: 0.33)
    public static let systemPurple: Color = Color(red: 0.69, green: 0.32, blue: 0.87)
    public static let systemTeal: Color = Color(red: 0.35, green: 0.78, blue: 0.98)
    public static let systemIndigo: Color = Color(red: 0.35, green: 0.34, blue: 0.84)
    public static let systemGray: Color = Color(red: 0.56, green: 0.56, blue: 0.58)
    public static let systemGray2: Color = Color(red: 0.68, green: 0.68, blue: 0.70)
    public static let systemGray3: Color = Color(red: 0.78, green: 0.78, blue: 0.80)
    public static let systemGray4: Color = Color(red: 0.82, green: 0.82, blue: 0.84)
    public static let systemGray5: Color = Color(red: 0.90, green: 0.90, blue: 0.91)
    public static let systemGray6: Color = Color(red: 0.95, green: 0.95, blue: 0.97)

    public static let label: Color = Color(white: 0)
    public static let secondaryLabel: Color = Color(red: 0.54, green: 0.54, blue: 0.55)
    public static let tertiaryLabel: Color = Color(red: 0.77, green: 0.77, blue: 0.78)
    public static let quaternaryLabel: Color = Color(red: 0.86, green: 0.86, blue: 0.87)

    public static let link: Color = Color(red: 0.00, green: 0.48, blue: 1.00)
    public static let placeholderText: Color = Color(red: 0.77, green: 0.77, blue: 0.78)

    public static let separator: Color = Color(red: 0.78, green: 0.78, blue: 0.78)
    public static let opaqueSeparator: Color = Color(red: 0.78, green: 0.78, blue: 0.78)

    public static let systemFill: Color = Color(red: 0.89, green: 0.89, blue: 0.90)
    public static let secondarySystemFill: Color = Color(red: 0.91, green: 0.91, blue: 0.92)
    public static let tertiarySystemFill: Color = Color(red: 0.94, green: 0.94, blue: 0.94)
    public static let quaternarySystemFill: Color = Color(red: 0.96, green: 0.96, blue: 0.96)

    public static let systemBackground: Color = Color(white: 1)
    public static let secondarySystemBackground: Color = Color(red: 0.95, green: 0.95, blue: 0.97)
    public static let tertiarySystemBackground: Color = Color(white: 1)

    public static let systemGroupedBackground: Color = Color(red: 0.95, green: 0.95, blue: 0.97)
    public static let secondarySystemGroupedBackground: Color = Color(white: 1)
    public static let tertiarySystemGroupedBackground: Color = Color(red: 0.95, green: 0.95, blue: 0.97)
}
