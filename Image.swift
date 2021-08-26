//
//  Image.swift
//
//  Created by Adriano Paladini on 17/08/21.
//

import UIKit

public class Image: UIImageView {

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

    public func pngData() -> Data? {
        return image?.pngData()
    }

    public func jpegData(compressionQuality: CGFloat) -> Data? {
        return image?.jpegData(compressionQuality: compressionQuality)
    }

    @discardableResult
    public convenience init(named: String) {
        self.init()
        self.named(named)
    }

    @available(iOS 13.0, *)
    @discardableResult
    public convenience init(named: String, bundle: Bundle) {
        self.init()
        self.named(named, bundle: bundle)
    }

    @discardableResult
    public convenience init(url: String) {
        self.init()
        self.from(url: url, placeholder: nil)
    }

    @discardableResult
    public convenience init(url: String, placeholder: String) {
        self.init()
        self.from(url: url, placeholder: UIImage(named: placeholder))
    }

    @available(iOS 13.0, *)
    @discardableResult
    public convenience init(url: String, systemNamePlaceholder: String) {
        self.init()
        self.from(url: url, placeholder: UIImage(systemName: systemNamePlaceholder))
    }

    @discardableResult
    public convenience init(named: String, renderingMode: UIImage.RenderingMode) {
        self.init()
        self.named(named, renderingMode: renderingMode)
    }

    @available(iOS 13.0, *)
    @discardableResult
    public convenience init(named: String, bundle: Bundle, renderingMode: UIImage.RenderingMode) {
        self.init()
        self.named(named, bundle: bundle, renderingMode: renderingMode)
    }

    @discardableResult
    public convenience init(named: String, highlightedImage: String) {
        self.init()
        self.named(named)
        self.highlightedNamedImage(highlightedImage)
    }

    @available(iOS 13.0, *)
    @discardableResult
    public convenience init(systemName: String) {
        self.init()
        self.systemName(systemName)
    }

    @available(iOS 13.0, *)
    @discardableResult
    public convenience init(systemName: String, renderingMode: UIImage.RenderingMode) {
        self.init()
        self.systemName(systemName, renderingMode: renderingMode)
    }

    @available(iOS 13.0, *)
    @discardableResult
    public convenience init(systemName: String, compatibleWith: UITraitCollection?) {
        self.init()
        self.systemName(systemName, compatibleWith: compatibleWith)
    }

    @available(iOS 13.0, *)
    @discardableResult
    public convenience init(systemName: String, withConfiguration: UIImage.Configuration?) {
        self.init()
        self.systemName(systemName, withConfiguration: withConfiguration)
    }

    @discardableResult
    public func named(_ named: String) -> Self {
        image = UIImage(named: named)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func named(_ named: String, bundle: Bundle) -> Self {
        image = UIImage(named: named, in: bundle, with: nil)
        return self
    }

    @discardableResult
    public func named(_ named: String, renderingMode: UIImage.RenderingMode) -> Self {
        image = UIImage(named: named)?.withRenderingMode(renderingMode)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func named(_ named: String, bundle: Bundle, renderingMode: UIImage.RenderingMode) -> Self {
        image = UIImage(named: named, in: bundle, with: nil)?.withRenderingMode(renderingMode)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func systemName(_ systemName: String) -> Self {
        image = UIImage(systemName: systemName)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func systemName(_ systemName: String, renderingMode: UIImage.RenderingMode) -> Self {
        image = UIImage(systemName: systemName)?.withRenderingMode(renderingMode)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func systemName(_ systemName: String, compatibleWith: UITraitCollection? = nil) -> Self {
        image = UIImage(systemName: systemName, compatibleWith: compatibleWith)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func systemName(_ systemName: String, withConfiguration: UIImage.Configuration? = nil) -> Self {
        image = UIImage(systemName: systemName, withConfiguration: withConfiguration)
        return self
    }

    @discardableResult
    public func fromUIImage(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }

    @discardableResult
    public func data(_ data: Data) -> Self {
        image = UIImage(data: data)
        return self
    }

    @discardableResult
    public func contentsOfFile(_ contentsOfFile: String) -> Self {
        image = UIImage(contentsOfFile: contentsOfFile)
        return self
    }

    @discardableResult
    public func foregroundColor(_ color: Color) -> Self {
        tintColor = color.uiColor
        return self
    }

    @discardableResult
    public func content(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }

    @discardableResult
    public func background(_ color: Color) -> Self {
        backgroundColor = color.uiColor
        return self
    }

    @discardableResult
    public func imageOrientation(_ orientation: UIImage.Orientation ) -> Self {
        if let originalImage = image?.cgImage {
            image = UIImage(cgImage: originalImage, scale: 1, orientation: orientation)
        }
        return self
    }

    @discardableResult
    public func imageScale(_ scale: CGFloat) -> Self {
        if let originalImage = image?.cgImage {
            image = UIImage(cgImage: originalImage, scale: scale, orientation: .up)
        }
        return self
    }

    @discardableResult
    public func highlightedNamedImage(_ named: String) -> Self {
        highlightedImage = UIImage(named: named)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func highlightedSystemNameImage(_ systemName: String) -> Self {
        highlightedImage = UIImage(systemName: systemName)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func highlightedSystemNameImage(_ systemName: String, compatibleWith: UITraitCollection? = nil) -> Self {
        highlightedImage = UIImage(systemName: systemName, compatibleWith: compatibleWith)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func highlightedSystemNameImage(_ systemName: String, withConfiguration: UIImage.Configuration? = nil) -> Self {
        highlightedImage = UIImage(systemName: systemName, withConfiguration: withConfiguration)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    public func preferredSymbolConfiguration(_ symbol: UIImage.SymbolConfiguration?) -> Self {
        preferredSymbolConfiguration = symbol
        return self
    }

    @discardableResult
    public func isHighlighted(_ bool: Bool) -> Self {
        isHighlighted = bool
        return self
    }

    @discardableResult
    public func animationImages(_ images: [UIImage]?) -> Self {
        animationImages = images
        return self
    }

    @discardableResult
    public func highlightedAnimationImages(_ images: [UIImage]?) -> Self {
        highlightedAnimationImages = images
        return self
    }

    @discardableResult
    public func animationDuration(_ interval: TimeInterval) -> Self {
        animationDuration = interval
        return self
    }

    @discardableResult
    public func animationRepeatCount(_ count: Int) -> Self {
        animationRepeatCount = count
        return self
    }

    @discardableResult
    public func startAnimation() -> Self {
        startAnimating()
        return self
    }

    @discardableResult
    public func stopAnimation() -> Self {
        stopAnimating()
        return self
    }

    @discardableResult
    public func isUserInteractionEnabled(_ bool: Bool) -> Self {
        isUserInteractionEnabled = bool
        return self
    }

    @discardableResult
    public func from(url: String, placeholder: UIImage? = nil) -> Self {
        image = placeholder
        guard let url = URL(string: url) else { return self }
        URLSession.shared.dataTask(with: url) { (data, _, error) -> Void in
            guard error == nil,
                  let data = data,
                  let myImage = UIImage(data: data)
            else { return }

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                UIView.transition(
                    with: self,
                    duration: 0.5,
                    options: .transitionCrossDissolve,
                    animations: { [weak self] in
                        self?.image = myImage
                    }, completion: nil)
            }
        }.resume()
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
