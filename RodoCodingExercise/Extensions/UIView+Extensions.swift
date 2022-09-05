//
//  UIView+Extensions.swift
//  RodoCodingExercise
//
//  Created by Junior Figuereo on 9/3/22.
//

import UIKit

// TODO: support UILayoutSupport
public protocol LayoutItem {}
extension UIView: LayoutItem {}
@available(iOS 9.0, *)
extension UILayoutGuide: LayoutItem {}

// MARK: - Pin: Superview
extension UIView {
    
    @discardableResult
    public func pinToEdgesOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (top: NSLayoutConstraint?, right: NSLayoutConstraint?, bottom: NSLayoutConstraint?, left: NSLayoutConstraint?) {
        return (
            self.pinToTopEdgeOfSuperview(withOffset: offset, priority: priority),
            self.pinToRightEdgeOfSuperview(withOffset: offset, priority: priority),
            self.pinToBottomEdgeOfSuperview(withOffset: offset, priority: priority),
            self.pinToLeftEdgeOfSuperview(withOffset: offset, priority: priority)
        )
    }

    @discardableResult
    public func pinToTopEdgeOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .top, offset: offset, priority: priority)
    }

    @discardableResult
    public func pinToRightEdgeOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .right, offset: -offset, priority: priority)
    }

    @discardableResult
    public func pinToBottomEdgeOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .bottom, offset: -offset, priority: priority)
    }

    @discardableResult
    public func pinToLeftEdgeOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .left, offset: offset, priority: priority)
    }

    @discardableResult
    public func pinToSideEdgesOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (left: NSLayoutConstraint?, right: NSLayoutConstraint?) {
        return (
            self.pinToLeftEdgeOfSuperview(withOffset: offset, priority: priority),
            self.pinToRightEdgeOfSuperview(withOffset: offset, priority: priority)
        )
    }

    @discardableResult
    public func pinToTopAndBottomEdgesOfSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (top: NSLayoutConstraint?, bottom: NSLayoutConstraint?) {
        return (
            self.pinToTopEdgeOfSuperview(withOffset: offset, priority: priority),
            self.pinToBottomEdgeOfSuperview(withOffset: offset, priority: priority)
        )
    }

}

// MARK: - Pin: Edges
extension UIView {

    @discardableResult
    public func pinTopEdgeToTopEdge(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .top, toAttribute: .top, ofItem: item, offset: offset, priority: priority)
    }

    @discardableResult
    public func pinRightEdgeToRightEdge(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .right, toAttribute: .right, ofItem: item, offset: -offset, priority: priority)
    }

    @discardableResult
    public func pinBottomEdgeToBottomEdge(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .bottom, toAttribute: .bottom, ofItem: item, offset: -offset, priority: priority)
    }

    @discardableResult
    public func pinLeftEdgeToLeftEdge(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .left, toAttribute: .left, ofItem: item, offset: offset, priority: priority)
    }
    
}

// MARK: - Center
extension UIView {

    @discardableResult
    public func centerInSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (horizontal: NSLayoutConstraint?, vertical: NSLayoutConstraint?){
        return (
            self.centerHorizontallyInSuperview(withOffset: offset, priority: priority),
            self.centerVerticallyInSuperview(withOffset: offset, priority: priority)
        )
    }

    @discardableResult
    public func centerHorizontallyInSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .centerX, offset: offset, priority: priority)
    }

    @discardableResult
    public func centerVerticallyInSuperview(withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(edgeAttribute: .centerY, offset: offset, priority: priority)
    }

    @discardableResult
    public func centerHorizontally(to item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .centerX, toAttribute: .centerX, ofItem: item, offset: offset, priority: priority)
    }

    @discardableResult
    public func centerVertically(to item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .centerY, toAttribute: .centerY, ofItem: item, offset: offset, priority: priority)
    }

}

// MARK: - Size
extension UIView {
    
    @discardableResult
    public func size(toWidth width: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .width, size: width, priority: priority)
    }

    @discardableResult
    public func size(toMinWidth width: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .width, size: width, relatedBy: .greaterThanOrEqual, priority: priority)
    }

    @discardableResult
    public func size(toMaxWidth width: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .width, size: width, relatedBy: .lessThanOrEqual, priority: priority)
    }

    @discardableResult
    public func size(toHeight height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .height, size: height, priority: priority)
    }

    @discardableResult
    public func size(toMinHeight height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .height, size: height, relatedBy: .greaterThanOrEqual, priority: priority)
    }

    @discardableResult
    public func size(toMaxHeight height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(sizeAttribute: .height, size: height, relatedBy: .lessThanOrEqual, priority: priority)
    }

    @discardableResult
    public func size(toWidthAndHeight size: CGFloat, priority: UILayoutPriority? = nil) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        return (
            self.size(toWidth: size, priority: priority),
            self.size(toHeight: size, priority: priority)
        )
    }

    @discardableResult
    public func size(toMinWidthAndHeight size: CGFloat, priority: UILayoutPriority? = nil) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        return (
            self.size(toMinWidth: size, priority: priority),
            self.size(toMinHeight: size, priority: priority)
        )
    }

    @discardableResult
    public func size(toMaxWidthAndHeight size: CGFloat, priority: UILayoutPriority? = nil) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        return (
            self.size(toMaxWidth: size, priority: priority),
            self.size(toMaxHeight: size, priority: priority)
        )
    }

    @discardableResult
    public func sizeWidthToWidth(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .width, toAttribute: .width, ofItem: item, offset: -offset, priority: priority)
    }

    @discardableResult
    public func sizeHeightToHeight(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .height, toAttribute: .height, ofItem: item, offset: -offset, priority: priority)
    }

    @discardableResult
    public func sizeHeightToWidth(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .height, toAttribute: .width, ofItem:item, offset: -offset, priority: priority)
    }

    @discardableResult
    public func sizeWidthToHeight(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .width, toAttribute: .height, ofItem:item, offset: -offset, priority: priority)
    }

    @discardableResult
    public func sizeWidthAndHeightToWidthAndHeight(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (width: NSLayoutConstraint?, height: NSLayoutConstraint?) {
        return (
            self.sizeWidthToWidth(of: item, withOffset: offset, priority: priority),
            self.sizeHeightToHeight(of: item, withOffset: offset, priority: priority)
        )
    }

    @discardableResult
    public func sizeHeightToWidth(withAspectRatio aspectRatio: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .height, toAttribute: .width, ofItem: self, multiplier: aspectRatio, priority: priority)
    }

    @discardableResult
    public func sizeWidthToHeight(withAspectRatio aspectRatio: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .width, toAttribute: .height, ofItem: self, multiplier: aspectRatio, priority: priority)
    }

}

// MARK: - Position
extension UIView {
    
    @discardableResult
    public func positionAbove(_ item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .bottom, toAttribute: .top, ofItem: item, offset: -offset, priority: priority)
    }

    @discardableResult
    public func positionToTheRight(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .left, toAttribute: .right, ofItem: item, offset: offset, priority: priority)
    }

    @discardableResult
    public func positionBelow(_ item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .top, toAttribute: .bottom, ofItem: item, offset: offset, priority: priority)
    }

    @discardableResult
    public func positionToTheLeft(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        return self.constrain(attribute: .right, toAttribute: .left, ofItem: item, offset: -offset, priority: priority)
    }

}

// MARK: - Between
extension UIView {
    
    @discardableResult
    public func fitBetween(top topItem: LayoutItem, andBottom bottomItem: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (top: NSLayoutConstraint?, bottom: NSLayoutConstraint?){
        return (
            self.positionBelow(topItem, withOffset: offset, priority: priority),
            self.positionAbove( bottomItem, withOffset: offset, priority: priority)
        )
    }

    @discardableResult
    public func fitBetween(left leftItem: LayoutItem, andRight rightItem: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> (left: NSLayoutConstraint?, right: NSLayoutConstraint?){
        return (
            self.positionToTheRight(of: leftItem, withOffset: offset, priority: priority),
            self.positionToTheLeft(of: rightItem, withOffset: offset, priority: priority)
        )
    }
    
}

// MARK: - Fill
extension UIView {
    
    public func fillHorizontally(withViews views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        if views.count == 1 {
            views.first?.pinToSideEdgesOfSuperview(withOffset: separation, priority: priority)
            return
        }

        var lastView: UIView!
        for view in views {
            if lastView != nil{
                lastView.sizeWidthToWidth(of: view)
                view.positionToTheRight(of: lastView, withOffset: separation, priority: priority)
            } else {
                view.pinToLeftEdgeOfSuperview(withOffset: separation, priority: priority)
            }
            lastView = view
        }

        _ = lastView?.pinToRightEdgeOfSuperview(withOffset: separation, priority: priority)
    }

    public func fillVertically(withViews views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        if views.count == 1 {
            views.first?.pinToTopAndBottomEdgesOfSuperview(withOffset: separation, priority: priority)
            return
        }

        var lastView: UIView!
        for view in views {
            if lastView != nil{
                lastView.sizeHeightToHeight(of: view)
                view.positionBelow(lastView, withOffset: separation, priority: priority)
            } else {
                view.pinToTopEdgeOfSuperview(withOffset: separation, priority: priority)
            }
            lastView = view
        }

        _ = lastView?.pinToBottomEdgeOfSuperview(withOffset: separation, priority: priority)
    }

}

// MARK: - Bound
extension UIView {

    public func boundHorizontally(withViews views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        if views.count > 1 {
            var lastView: UIView!
            for view in views {
                if lastView != nil{
                    view.positionToTheRight(of: lastView, withOffset: separation, priority: priority)
                }
                lastView = view
            }
        }

        self.pinLeftEdgeToLeftEdge(of: views.first!, withOffset: -separation, priority: priority)
        self.pinRightEdgeToRightEdge(of: views.last!, withOffset: -separation, priority: priority)
    }

    public func boundVertically(withViews views: [UIView], separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(views.count > 0, "Can only distribute 1 or more views")

        if views.count > 1 {
            var lastView: UIView!
            for view in views {
                if lastView != nil {
                    view.positionBelow(lastView, withOffset: separation, priority: priority)
                }
                lastView = view
            }
        }

        self.pinTopEdgeToTopEdge(of: views.first!, withOffset: -separation, priority: priority)
        self.pinBottomEdgeToBottomEdge(of: views.last!, withOffset: -separation, priority: priority)
    }

}

// MARK: - General
extension UIView {

    @discardableResult
    public func constrain(item: LayoutItem, attribute itemAttribute: NSLayoutConstraint.Attribute, toItem: LayoutItem? = nil, attribute toAttribute: NSLayoutConstraint.Attribute = .notAnAttribute, relatedBy: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        if let view = item as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint = NSLayoutConstraint(
            item: item, attribute: itemAttribute,
            relatedBy: relatedBy,
            toItem: toItem, attribute: toAttribute,
            multiplier: multiplier, constant: offset
        )
        if priority != nil {
            constraint.priority = priority!
        }
        self.addConstraint(constraint)
        return constraint
    }
}

// MARK: - Array[UIView]
extension Array where Element: UIView {
    
    public func centerHorizontally(to item: LayoutItem, withSeparation separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(self.count > 0, "Can only center 1 or more views")
        
        if self.count % 2 == 0 { // even
            let rightIndex = self.count/2
            let leftIndex = rightIndex-1
            
            _ = self[leftIndex].constrain(attribute: .right, toAttribute: .centerX, ofItem: item, relatedBy: .lessThanOrEqual, offset:-separation/2, priority: priority)
            _ = self[rightIndex].constrain(attribute: .left, toAttribute: .centerX, ofItem: item, relatedBy: .lessThanOrEqual, offset:separation/2, priority: priority)
            
            if self.count > 2 {
                let rightViews = Array(self[rightIndex+1...self.count-1])
                if rightViews.count > 0 {
                    rightViews.positionToTheRight(of: self[rightIndex], withOffset: separation, priority: priority)
                }
                
                let leftViews = Array(self[0...leftIndex-1])
                if leftViews.count > 0 {
                    leftViews.positionToTheLeft(of: self[leftIndex], withOffset: separation, priority: priority)
                }
            }
        } else { // odd
            let centerIndex = self.count/2
            self[centerIndex].centerHorizontally(to: item)
            
            if self.count > 1 {
                let rightViews = Array(self[centerIndex+1...self.count-1])
                if rightViews.count > 0 {
                    rightViews.positionToTheRight(of: self[centerIndex], withOffset: separation, priority: priority)
                }
                
                let leftViews = Array(self[0...centerIndex-1])
                if leftViews.count > 0 {
                    leftViews.positionToTheLeft(of: self[centerIndex], withOffset: separation, priority: priority)
                }
            }
        }
    }
    
    public func centerVertically(to item: LayoutItem, withSeparation separation: CGFloat = 0, priority: UILayoutPriority? = nil) {
        assert(self.count > 0, "Can only center 1 or more views")
        
        if self.count % 2 == 0 { // even
            let belowIndex = self.count/2
            let aboveIndex = belowIndex-1
            
            _ = self[aboveIndex].constrain(attribute: .bottom, toAttribute: .centerY, ofItem: item, relatedBy: .lessThanOrEqual, offset:-separation/2, priority: priority)
            _ = self[belowIndex].constrain(attribute: .top, toAttribute: .centerY, ofItem: item, relatedBy: .lessThanOrEqual, offset:separation/2, priority: priority)
            
            if self.count > 2 {
                let belowViews = Array(self[belowIndex+1...self.count-1])
                if belowViews.count > 0 {
                    belowViews.positionBelow(self[belowIndex], withOffset: separation, priority: priority)
                }
                
                let aboveViews = Array(self[0...aboveIndex-1])
                if aboveViews.count > 0 {
                    aboveViews.positionAbove(self[aboveIndex], withOffset: separation, priority: priority)
                }
            }
        }else{ // ood
            let centerIndex = self.count/2
            self[centerIndex].centerVertically(to: item)
            
            if self.count > 1 {
                let belowViews = Array(self[centerIndex+1...self.count-1])
                if belowViews.count > 0 {
                    belowViews.positionBelow(self[centerIndex], withOffset: separation, priority: priority)
                }
                
                let aboveViews = Array(self[0...centerIndex-1])
                if aboveViews.count > 0 {
                    aboveViews.positionAbove(self[centerIndex], withOffset: separation, priority: priority)
                }
            }
        }
    }
    
    public func positionAbove(_ item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        var lastItem = item
        for view in self.reversed() {
            view.positionAbove(lastItem, withOffset: offset, priority: priority)
            lastItem = view
        }
    }
    
    public func positionToTheRight(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        var lastItem = item
        for view in self {
            view.positionToTheRight(of: lastItem, withOffset: offset, priority: priority)
            lastItem = view
        }
    }
    
    public func positionBelow(_ item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        var lastItem = item
        for view in self {
            view.positionBelow(lastItem, withOffset: offset, priority: priority)
            lastItem = view
        }
    }
    
    public func positionToTheLeft(of item: LayoutItem, withOffset offset: CGFloat = 0, priority: UILayoutPriority? = nil) {
        var lastItem = item
        for view in self.reversed() {
            view.positionToTheLeft(of: lastItem, withOffset: offset, priority: priority)
            lastItem = view
        }
    }
    
}

// MARK: - Private
extension UIView {

    fileprivate func constrain(sizeAttribute: NSLayoutConstraint.Attribute, size: CGFloat = 0, relatedBy: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        return self.constrain(item: self, attribute: sizeAttribute, relatedBy: relatedBy, multiplier: 0, offset: size, priority: priority)
    }

    fileprivate func constrain(edgeAttribute: NSLayoutConstraint.Attribute, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        assert(self.superview != nil, "Can't create constraints without a super view")
        guard let superview = self.superview else {
            return nil
        }

        return superview.constrain(item: self, attribute: edgeAttribute, toItem: superview, attribute: edgeAttribute, offset: offset, priority: priority)
    }

    fileprivate func constrain(attribute: NSLayoutConstraint.Attribute, toAttribute itemAttribute: NSLayoutConstraint.Attribute, ofItem item: LayoutItem, relatedBy: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint? {
        let commonSuperview: UIView? = {
            guard let view = item as? UIView else {
                return self.superview
            }
            
            return {
                var startView: UIView! = self
                var commonSuperview: UIView?
                repeat {
                    if view.isDescendant(of: startView) {
                        commonSuperview = startView
                    }
                    startView = startView.superview
                } while (startView != nil && commonSuperview == nil)
                return commonSuperview
            }()
        }()
        
        assert(commonSuperview != nil, "Can't create constraints without a common super view")
        if commonSuperview == nil {
            return nil
        }
        
        return commonSuperview!.constrain(item: self, attribute: attribute, toItem: item, attribute: itemAttribute, relatedBy: relatedBy, multiplier: multiplier, offset: offset, priority: priority)
    }
    
}

