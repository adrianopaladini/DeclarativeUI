//
//  HStack.swift
//
//  Created by Adriano Paladini on 17/08/21.
//

import UIKit

public class HStack: Stack {

    @discardableResult
    public convenience init(alignment: UIStackView.Alignment = .fill,
                            spacing: CGFloat = 0,
                            @CustomArrayBuilder<UIView> content: () -> [UIView]) {
        self.init()
        self.axis = .horizontal
        self.alignment = alignment
        self.spacing = spacing
        addArranged(content())
    }

    @available(*, unavailable, message:"")
    @discardableResult
    public override func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        return self
    }
}

public class VStack: Stack {

    @discardableResult
    public convenience init(alignment: UIStackView.Alignment = .fill,
                            spacing: CGFloat = 0,
                            @CustomArrayBuilder<UIView> content: () -> [UIView]) {
        self.init()
        self.axis = .vertical
        self.alignment = alignment
        self.spacing = spacing
        addArranged(content())
    }

    @available(*, unavailable, message:"")
    @discardableResult
    public override func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        return self
    }
}

public class Stack: UIStackView {

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
    public convenience init(axis: NSLayoutConstraint.Axis = .vertical,
                            alignment: UIStackView.Alignment = .fill,
                            spacing: CGFloat = 0,
                            @CustomArrayBuilder<UIView> content: () -> [UIView]) {
        self.init()
        self.axis(axis)
        self.alignment = alignment
        self.spacing = spacing
        addArranged(content())
    }

    @discardableResult
    public func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }

    @discardableResult
    public func addArranged(_ views: [UIView]) -> Self {
        views.forEach { view in
            self.addArrangedSubview(view)
        }
        return self
    }

    @discardableResult
    public func distribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }

    @discardableResult
    public func isBaselineRelativeArrangement(_ bool: Bool) -> Self {
        self.isBaselineRelativeArrangement = bool
        return self
    }

    @discardableResult
    public func isLayoutMarginsRelativeArrangement(_ bool: Bool) -> Self {
        self.isLayoutMarginsRelativeArrangement = bool
        return self
    }

    @discardableResult
    public func padding(_ insets: NSDirectionalEdgeInsets) -> Self {
        isLayoutMarginsRelativeArrangement = insets != .zero
        directionalLayoutMargins = insets
        return self
    }

    @discardableResult
    public func padding(_ margin: CGFloat) -> Self {
        isLayoutMarginsRelativeArrangement = margin != .zero
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)
        return self
    }

    @discardableResult
    public func padding(_ direction: Direction, _ margin: CGFloat) -> Self {
        isLayoutMarginsRelativeArrangement = margin != .zero
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
