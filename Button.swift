//
//  Button.swift
//
//  Created by Adriano Paladini on 17/08/21.
//

import UIKit

public class Button: UIButton {

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

    @discardableResult
    public convenience init(action: @escaping () -> Void,
                            @CustomArrayBuilder<UIView> label: () -> [UIView]) {
        self.init()
        let view = Stack(axis: .horizontal, spacing: 0) { label() }
        addSubviews([view])
        view.edgesToSuperView()
        onTap(action)
    }

    @discardableResult
    public convenience init(_ title: String,
                            action: @escaping () -> Void) {
        self.init()
        self.title(title)
        foregroundColor(Color.link)
        onTap(action)
    }

    @discardableResult
    public func title(_ text: String?, for state: UIControl.State = .normal) -> Self {
        if let string = text {
            setTitle(string, for: state)
        }
        return self
    }

    @discardableResult
    public func attributedTitle(_ text: NSAttributedString?, for state: UIControl.State = .normal) -> Self {
        if let string = text {
            setAttributedTitle(string, for: state)
        }
        return self
    }

    @discardableResult
    public func alignment(_ horizontal: UIControl.ContentHorizontalAlignment) -> Self {
        contentHorizontalAlignment = horizontal
        return self
    }

    @discardableResult
    public func alignment(_ vertical: UIControl.ContentVerticalAlignment) -> Self {
        contentVerticalAlignment = vertical
        return self
    }

    @discardableResult
    public func font(_ font: Font) -> Self {
        titleLabel?.font = font.uiFont
        return self
    }

    @discardableResult
    public func weight(_ weight: Font.Weight) -> Self {
        if let font = titleLabel?.font {
            let newDescriptor = font.fontDescriptor.addingAttributes([.traits: [
                                                                        UIFontDescriptor.TraitKey.weight: weight.uiFontWeight]
            ])
            titleLabel?.font = UIFont(descriptor: newDescriptor, size: font.pointSize)
        }
        return self
    }

    @discardableResult
    public func preferred(forTextStyle style: UIFont.TextStyle) -> Self {
        titleLabel?.font = UIFont.preferredFont(forTextStyle: style)
        return self
    }

    @discardableResult
    public func scaled(font: UIFont) -> Self {
        titleLabel?.font = UIFontMetrics.default.scaledFont(for: font)
        return self
    }

    @discardableResult
    public func image(_ image: Image?, for state: UIControl.State = .normal) -> Self {
        if let icon = image {
            setImage(icon.image, for: state)
        }
        return self
    }

    @discardableResult
    public func addAction(for controlEvents: UIControl.Event, overwrite: Bool = false, _ action: @escaping () -> Void) -> Self {
        if overwrite {
            removeTarget(nil, action: nil, for: controlEvents)
        }
        let action = ClosureAction(attachTo: self, closure: action)
        addTarget(action, action: ClosureAction.selector, for: controlEvents)
        return self
    }

    @discardableResult
    public func onTap(overwrite: Bool = false, _ action: (() -> Void)?) -> Self {
        if let currentAction = action {
            addAction(for: UIControl.Event.touchUpInside, overwrite: overwrite, currentAction)
        }
        return self
    }

    @discardableResult
    public func background(_ image: Image, for state: UIControl.State = .normal) -> Self {
        setBackgroundImage(image.image, for: state)
        return self
    }

    @discardableResult
    public func foregroundColor(_ color: Color, for state: UIControl.State = .normal) -> Self {
        setTitleColor(color.uiColor, for: state)
        return self
    }

    @discardableResult
    public func background(_ color: Color) -> Self {
        self.backgroundColor = color.uiColor
        return self
    }

    @discardableResult
    public func titleShadow(_ color: Color, for state: UIControl.State = .normal) -> Self {
        setTitleShadowColor(color.uiColor, for: state)
        return self
    }

    @discardableResult
    public func tint(_ color: Color) -> Self {
        tintColor = color.uiColor
        return self
    }

    @discardableResult
    public func content(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }

    @discardableResult
    public func contentEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        contentEdgeInsets = insets
        return self
    }

    @discardableResult
    public func titleEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        titleEdgeInsets = insets
        return self
    }

    @discardableResult
    public func reversesTitleShadowWhenHighlighted(_ bool: Bool) -> Self {
        reversesTitleShadowWhenHighlighted = bool
        return self
    }

    @discardableResult
    public func imageEdgeInsets(_ insets: UIEdgeInsets) -> Self {
        imageEdgeInsets = insets
        return self
    }

    @discardableResult
    public func adjustsImageWhenHighlighted(_ bool: Bool) -> Self {
        adjustsImageWhenHighlighted = bool
        return self
    }

    @discardableResult
    public func adjustsImageWhenDisabled(_ bool: Bool) -> Self {
        adjustsImageWhenDisabled = bool
        return self
    }

    @discardableResult
    public func showsTouchWhenHighlighted(_ bool: Bool) -> Self {
        showsTouchWhenHighlighted = bool
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    public func role(_ role: UIButton.Role) -> Self {
        self.role = role
        return self
    }

    @available(iOS 13.4, *)
    @discardableResult
    public func isPointerInteractionEnabled(_ bool: Bool) -> Self {
        self.isPointerInteractionEnabled = bool
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    public func menu(_ menu: UIMenu?) -> Self {
        self.menu = menu
        return self
    }

    @discardableResult
    public func clipped(_ bool: Bool = true) -> Self {
        clipsToBounds = bool
        return self
    }

    @discardableResult
    public func padding(_ insets: NSDirectionalEdgeInsets) -> Self {
        directionalLayoutMargins = insets
        return self
    }

    @discardableResult
    public func padding(_ margin: CGFloat) -> Self {
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)
        return self
    }

    @discardableResult
    public func padding(_ direction: Direction, _ margin: CGFloat) -> Self {
        switch direction {
        case .all:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: margin,
                                                               leading: margin,
                                                               bottom: margin,
                                                               trailing: margin)
        case .top:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: margin,
                                                               leading: directionalLayoutMargins.leading,
                                                               bottom: directionalLayoutMargins.bottom,
                                                               trailing: directionalLayoutMargins.trailing)
        case .bottom:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: directionalLayoutMargins.top,
                                                               leading: directionalLayoutMargins.leading,
                                                               bottom: margin,
                                                               trailing: directionalLayoutMargins.trailing)
        case .leading:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: directionalLayoutMargins.top,
                                                               leading: margin,
                                                               bottom: directionalLayoutMargins.bottom,
                                                               trailing: directionalLayoutMargins.trailing)
        case .trailing:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: directionalLayoutMargins.top,
                                                               leading: directionalLayoutMargins.leading,
                                                               bottom: directionalLayoutMargins.bottom,
                                                               trailing: margin)
        case .topLeading:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: margin,
                                                               leading: margin,
                                                               bottom: directionalLayoutMargins.bottom,
                                                               trailing: directionalLayoutMargins.trailing)
        case .topTrailing:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: margin,
                                                               leading: directionalLayoutMargins.leading,
                                                               bottom: directionalLayoutMargins.bottom,
                                                               trailing: margin)
        case .bottomLeading:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: directionalLayoutMargins.top,
                                                               leading: margin,
                                                               bottom: margin,
                                                               trailing: directionalLayoutMargins.trailing)
        case .bottomTrailing:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: directionalLayoutMargins.top,
                                                               leading: directionalLayoutMargins.leading,
                                                               bottom: margin,
                                                               trailing: margin)
        case .horizontal:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: directionalLayoutMargins.top,
                                                               leading: margin,
                                                               bottom: directionalLayoutMargins.bottom,
                                                               trailing: margin)
        case .vertical:
            directionalLayoutMargins = NSDirectionalEdgeInsets(top: margin,
                                                               leading: directionalLayoutMargins.leading,
                                                               bottom: margin,
                                                               trailing: directionalLayoutMargins.trailing)
        }
        return self
    }
}
