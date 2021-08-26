//
//  View.swift
//
//  Created by Adriano Paladini on 17/08/21.
//

import UIKit

public class View: UIView {

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

    public var screenshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    @discardableResult
    public func isUserInteractionEnabled(_ bool: Bool) -> Self {
        isUserInteractionEnabled = bool
        return self
    }

    @discardableResult
    public func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }

    @available(iOS 14.0, *)
    @discardableResult
    public func focusGroupIdentifier(_ identifier: String?) -> Self {
        focusGroupIdentifier = identifier
        return self
    }

    @discardableResult
    public func semanticContentAttribute(_ attribute: UISemanticContentAttribute) -> Self {
        semanticContentAttribute = attribute
        return self
    }

    @discardableResult
    public func transform(_ transform: CGAffineTransform) -> Self {
        self.transform = transform
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func transform3D(_ transform3D: CATransform3D) -> Self {
        self.transform3D = transform3D
        return self
    }

    @discardableResult
    public func contentScaleFactor(_ scale: CGFloat) -> Self {
        contentScaleFactor = scale
        return self
    }

    @discardableResult
    public func isMultipleTouchEnabled(_ bool: Bool) -> Self {
        isMultipleTouchEnabled = bool
        return self
    }

    @discardableResult
    public func isExclusiveTouch(_ bool: Bool) -> Self {
        isExclusiveTouch = bool
        return self
    }

    @discardableResult
    public func autoresizesSubviews(_ bool: Bool) -> Self {
        autoresizesSubviews = bool
        return self
    }

    @discardableResult
    public func autoresizingMask(_ mask: UIView.AutoresizingMask) -> Self {
        autoresizingMask = mask
        return self
    }

    @discardableResult
    public func layoutMargins(_ insets: UIEdgeInsets) -> Self {
        layoutMargins = insets
        return self
    }

    @discardableResult
    public func directionalLayoutMargins(_ insets: NSDirectionalEdgeInsets) -> Self {
        directionalLayoutMargins = insets
        return self
    }

    @discardableResult
    public func preservesSuperviewLayoutMargins(_ bool: Bool) -> Self {
        preservesSuperviewLayoutMargins = bool
        return self
    }

    @discardableResult
    public func insetsLayoutMarginsFromSafeArea(_ bool: Bool) -> Self {
        insetsLayoutMarginsFromSafeArea = bool
        return self
    }

    @discardableResult
    public func clipped(_ bool: Bool = true) -> Self {
        clipsToBounds = bool
        return self
    }

    @discardableResult
    public func background(_ color: Color) -> Self {
        backgroundColor = color.uiColor
        return self
    }

    @discardableResult
    public func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }

    @discardableResult
    public func isOpaque(_ bool: Bool) -> Self {
        isOpaque = bool
        return self
    }

    @discardableResult
    public func clearsContextBeforeDrawing(_ bool: Bool) -> Self {
        clearsContextBeforeDrawing = bool
        return self
    }

    @discardableResult
    public func isHidden(_ bool: Bool) -> Self {
        isHidden = bool
        return self
    }

    @discardableResult
    public func content(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }

    @discardableResult
    public func mask(_ view: UIView?) -> Self {
        mask = view
        return self
    }

    @discardableResult
    public func tint(_ color: Color) -> Self {
        tintColor = color.uiColor
        return self
    }

    @discardableResult
    public func tintAdjustment(_ mode: UIView.TintAdjustmentMode) -> Self {
        tintAdjustmentMode = mode
        return self
    }

    @discardableResult
    public func gestureRecognizers(_ recognizers: [UIGestureRecognizer]?) -> Self {
        gestureRecognizers = recognizers
        return self
    }

    @discardableResult
    public func motionEffects(_ effects: [UIMotionEffect]) -> Self {
        motionEffects = effects
        return self
    }

    @discardableResult
    public func translatesAutoresizingMaskIntoConstraints(_ bool: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = bool
        return self
    }

    @discardableResult
    public func restorationIdentifier(_ identifier: String?) -> Self {
        restorationIdentifier = identifier
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func overrideUserInterfaceStyle(_ style: UIUserInterfaceStyle) -> Self {
        overrideUserInterfaceStyle = style
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
    public func border(_ color: Color = .black, width: CGFloat = 0) -> Self {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
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
        isUserInteractionEnabled = true
        gestureRecognizers?.removeAll(where: { (gesture: UIGestureRecognizer) in gesture is UILongPressGestureRecognizer })
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
