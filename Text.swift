//
//  Text.swift
//
//  Created by Adriano Paladini on 17/08/21.
//

import UIKit

public class Text: UILabel {

    public enum Direction {
        case all
        case top
        case bottom
        case leading
        case trailing
        case topLeading
        case topTrailing
        case bottomLeading
        case bottomTrailing
        case horizontal
        case vertical
    }

    private var insets: NSDirectionalEdgeInsets = .zero

    public override func drawText(in rect: CGRect) {
        let inset = UIEdgeInsets(top: insets.top, left: insets.leading, bottom: insets.bottom, right: insets.trailing)
        super.drawText(in: rect.inset(by: inset))
    }

    public override var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + insets.leading + insets.trailing
        let heigth = superContentSize.height + insets.top + insets.bottom
        return CGSize(width: width, height: heigth)
    }

    @discardableResult
    public convenience init(_ text: String?) {
        self.init()
        self.text = text
        numberOfLines = 0
    }

    @discardableResult
    public convenience init(_ text: NSAttributedString?) {
        self.init()
        self.attributedText = text
        numberOfLines = 0
    }

    @discardableResult
    public func text(_ text: String?) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    public func font(_ font: Font) -> Self {
        self.font = font.uiFont
        return self
    }

    @discardableResult
    public func fontWeight(_ weight: Font.Weight) -> Self {
        let newDescriptor = self.font.fontDescriptor.addingAttributes([.traits: [
                                                                        UIFontDescriptor.TraitKey.weight: weight]
        ])
        self.font = UIFont(descriptor: newDescriptor, size: self.font.pointSize)
        return self
    }

    @discardableResult
    public func bold() -> Self {
        fontWeight(.bold)
        return self
    }

    @discardableResult
    public func italic() -> Self {
        let newDescriptor = self.font.fontDescriptor.withSymbolicTraits(.traitItalic) ?? self.font.fontDescriptor
        self.font = UIFont(descriptor: newDescriptor, size: self.font.pointSize)
        return self
    }

    private func addAttribute(_ name: NSAttributedString.Key, value: Any) {
        var attributedString: NSMutableAttributedString
        if let attributed = attributedText {
            attributedString = NSMutableAttributedString(attributedString: attributed)
        } else {
            attributedString = NSMutableAttributedString(string: text ?? "")
        }
        let range = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttribute(name, value: value, range: range)
        attributedText = attributedString
    }

    @discardableResult
    public func kerning(_ kerning: CGFloat) -> Self {
        addAttribute(.kern, value: kerning)
        return self
    }

    @discardableResult
    public func strikethrough(_ active: Bool = true, color: Color = .black) -> Self {
        addAttribute(.strikethroughStyle, value: 2)
        addAttribute(.strikethroughColor, value: color.uiColor)
        return self
    }

    @discardableResult
    public func underline(_ active: Bool = true, color: Color = .black) -> Self {
        addAttribute(.underlineStyle, value: NSUnderlineStyle.thick.rawValue)
        addAttribute(.underlineColor, value: color.uiColor)
        return self
    }

    @discardableResult
    public func foregroundColor(_ color: Color) -> Self {
        textColor = color.uiColor
        return self
    }

    @discardableResult
    public func background(_ color: Color) -> Self {
        backgroundColor = color.uiColor
        return self
    }

    @discardableResult
    public func multilineTextAlignment(_ alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        return self
    }

    @discardableResult
    public func lineBreak(_ mode: NSLineBreakMode) -> Self {
        lineBreakMode = mode
        return self
    }

    @discardableResult
    public func attributedText(_ text: NSAttributedString?) -> Self {
        attributedText = text
        return self
    }

    @discardableResult
    public func content(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }

    @discardableResult
    public func highlightedForeground(_ color: Color) -> Self {
        highlightedTextColor = color.uiColor
        return self
    }

    @discardableResult
    public func isHighlighted(_ bool: Bool) -> Self {
        isHighlighted = bool
        return self
    }

    @discardableResult
    public func isEnabled(_ bool: Bool) -> Self {
        isEnabled = bool
        return self
    }

    @discardableResult
    public func isUserInteractionEnabled(_ bool: Bool) -> Self {
        isUserInteractionEnabled = bool
        return self
    }

    @discardableResult
    public func lineLimit(_ lines: Int) -> Self {
        numberOfLines = lines
        return self
    }

    @discardableResult
    public func adjustsFontSizeToFitWidth(_ bool: Bool) -> Self {
        adjustsFontSizeToFitWidth = bool
        return self
    }

    @discardableResult
    public func baselineAdjustment(_ adjustment: UIBaselineAdjustment) -> Self {
        baselineAdjustment = adjustment
        return self
    }

    @discardableResult
    public func minimumScaleFactor(_ scale: CGFloat) -> Self {
        minimumScaleFactor = scale
        return self
    }

    @discardableResult
    public func allowsDefaultTighteningForTruncation(_ bool: Bool) -> Self {
        allowsDefaultTighteningForTruncation = bool
        return self
    }

    @discardableResult
    public func lineBreakStrategy(_ strategy: NSParagraphStyle.LineBreakStrategy) -> Self {
        lineBreakStrategy = strategy
        return self
    }

    @discardableResult
    public func preferredMaxLayoutWidth(_ width: CGFloat) -> Self {
        preferredMaxLayoutWidth = width
        return self
    }

    @discardableResult
    public func clipped(_ bool: Bool = true) -> Self {
        clipsToBounds = bool
        return self
    }

    @discardableResult
    public func cornerRadius(_ radius: CGFloat, corners: Direction = .all) -> Self {
        layer.cornerRadius = radius
        switch corners {
        case .all, .horizontal, .vertical:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .top:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom:
            layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .leading:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .trailing:
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .topLeading:
            layer.maskedCorners = .layerMinXMinYCorner
        case .topTrailing:
            layer.maskedCorners = .layerMaxXMinYCorner
        case .bottomLeading:
            layer.maskedCorners = .layerMinXMaxYCorner
        case .bottomTrailing:
            layer.maskedCorners = .layerMaxXMaxYCorner
        }
        return self
    }

    @discardableResult
    public func shadow(_ color: Color = .black, offset: CGSize = .zero, radius: CGFloat = 3, opacity: Float = 0.5, path: CGPath? = nil) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowPath = path
        return self
    }

    @discardableResult
    public func onTap(overwrite: Bool = false, _ action: @escaping () -> Void) -> Self {
        if overwrite {
            gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UITapGestureRecognizer })
        }

        let action = ClosureAction(attachTo: self, closure: action)
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }

    @discardableResult
    public func onLongTap(overwrite: Bool = false, _ action: @escaping () -> Void) -> Self {
        if overwrite {
            gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UILongPressGestureRecognizer })
        }

        let action = ClosureAction(attachTo: self, closure: action)
        isUserInteractionEnabled = true
        addGestureRecognizer(UILongPressGestureRecognizer(target: action, action: ClosureAction.selector))
        return self
    }

    @discardableResult
    public func removeGesture() -> Self {
        isUserInteractionEnabled = false
        gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UILongPressGestureRecognizer })
        return self
    }

    @discardableResult
    public func padding(_ margin: CGFloat) -> Self {
        insets = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)
        return self
    }

    @discardableResult
    public func padding(_ insets: NSDirectionalEdgeInsets) -> Self {
        self.insets = insets
        return self
    }

    @discardableResult
    public func padding(_ direction: Direction, margin: CGFloat) -> Self {
        switch direction {
        case .all:
            insets = NSDirectionalEdgeInsets(top: margin,
                                             leading: margin,
                                             bottom: margin,
                                             trailing: margin)
        case .top:
            insets = NSDirectionalEdgeInsets(top: margin,
                                             leading: insets.leading,
                                             bottom: insets.bottom,
                                             trailing: insets.trailing)
        case .bottom:
            insets = NSDirectionalEdgeInsets(top: insets.top,
                                             leading: insets.leading,
                                             bottom: margin,
                                             trailing: insets.trailing)
        case .leading:
            insets = NSDirectionalEdgeInsets(top: insets.top,
                                             leading: margin,
                                             bottom: insets.bottom,
                                             trailing: insets.trailing)
        case .trailing:
            insets = NSDirectionalEdgeInsets(top: insets.top,
                                             leading: insets.leading,
                                             bottom: insets.bottom,
                                             trailing: margin)
        case .topLeading:
            insets = NSDirectionalEdgeInsets(top: margin,
                                             leading: margin,
                                             bottom: insets.bottom,
                                             trailing: insets.trailing)
        case .topTrailing:
            insets = NSDirectionalEdgeInsets(top: margin,
                                             leading: insets.leading,
                                             bottom: insets.bottom,
                                             trailing: margin)
        case .bottomLeading:
            insets = NSDirectionalEdgeInsets(top: insets.top,
                                             leading: margin,
                                             bottom: margin,
                                             trailing: insets.trailing)
        case .bottomTrailing:
            insets = NSDirectionalEdgeInsets(top: insets.top,
                                             leading: insets.leading,
                                             bottom: margin,
                                             trailing: margin)
        case .horizontal:
            insets = NSDirectionalEdgeInsets(top: insets.top,
                                             leading: margin,
                                             bottom: insets.bottom,
                                             trailing: margin)
        case .vertical:
            insets = NSDirectionalEdgeInsets(top: margin,
                                             leading: insets.leading,
                                             bottom: margin,
                                             trailing: insets.trailing)
        }
        return self
    }
}
