//
//  Spacer.swift
//
//  Created by Adriano Paladini on 17/08/21.
//

import UIKit

public class Spacer: UIView {

    private var minLength: CGFloat = 0

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
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setPriority()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        if superview?.description.contains("UIStackView") == true,
           let parent = superview as? UIStackView {

            if parent.axis == .horizontal {
                widthAnchor.constraint(greaterThanOrEqualToConstant: minLength).isActive = true
            } else {
                heightAnchor.constraint(greaterThanOrEqualToConstant: minLength).isActive = true
            }
        }
    }

    @discardableResult
    public convenience init(minLength: CGFloat) {
        self.init(frame: .zero)
        self.minLength = minLength
    }

    private func setPriority() {
        let lowestPriority = UILayoutPriority(1)
        setContentHuggingPriority(lowestPriority, for: .vertical)
        setContentHuggingPriority(lowestPriority, for: .horizontal)
        setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
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
        }
        return self
    }
}
