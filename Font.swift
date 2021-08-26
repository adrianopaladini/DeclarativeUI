//
//  Font.swift
//
//  Created by Adriano Paladini on 26/08/21.
//

import UIKit

public class Font: NSObject {

    private var object = UIFont()

    public var uiFont: UIFont {
        return object
    }

    private convenience init(_ uiFont: UIFont?) {
        self.init()
        object = uiFont ?? UIFont()
    }

    public static func system(size: CGFloat = 12, weight: Weight = .regular) -> Font {
        return Font(UIFont.systemFont(ofSize: size, weight: weight.uiFontWeight))
    }

    public static func custom(_ name: String, size: CGFloat) -> Font {
        let font = UIFont(name: name, size: size) ?? UIFont()
        return Font(UIFontMetrics.default.scaledFont(for: font))
    }

    public static func custom(_ name: String, fixedSize: CGFloat) -> Font {
        return Font(UIFont(name: name, size: fixedSize))
    }

    public static let largeTitle = Font.system(size: 34)
    public static let title = Font.system(size: 28)
    public static let title2 = Font.system(size: 22)
    public static let title3 = Font.system(size: 20)
    public static let headline = Font.system(size: 17)
    public static let body = Font.system(size: 17)
    public static let callout = Font.system(size: 16)
    public static let subheadline = Font.system(size: 15)
    public static let footnote = Font.system(size: 13)
    public static let caption = Font.system(size: 12)
    public static let caption2 = Font.system(size: 11)

    public class Weight: NSObject {
        private var objectWeight = UIFont.Weight.regular

        public var uiFontWeight: UIFont.Weight {
            return objectWeight
        }

        private convenience init(_ uiFontWeight: UIFont.Weight) {
            self.init()
            objectWeight = uiFontWeight
        }

        public static let ultraLight = Weight(UIFont.Weight.ultraLight)
        public static let thin = Weight(UIFont.Weight.thin)
        public static let light = Weight(UIFont.Weight.light)
        public static let regular = Weight(UIFont.Weight.regular)
        public static let medium = Weight(UIFont.Weight.medium)
        public static let semibold = Weight(UIFont.Weight.semibold)
        public static let bold = Weight(UIFont.Weight.bold)
        public static let heavy = Weight(UIFont.Weight.heavy)
        public static let black = Weight(UIFont.Weight.black)
    }
}
