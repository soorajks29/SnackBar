//
//  ToastView.swift
//  SnackBar
//
//  Created by Sooraj on 23/02/18.
//  Copyright © 2018 Sooraj. All rights reserved.
//

import UIKit

class ToastView: UIView {
    private static let hLabelGap: CGFloat = 40.0
    private static let vLabelGap: CGFloat = 15.0
    private static let hToastGap: CGFloat = 20.0
    private static let vToastGap: CGFloat = 15.0
    
    private var textLabel: UILabel!
    
    static func showInParent(_ parentView: UIView, _ text: String, duration: Double = 3.0) {
        for currentView in parentView.subviews {
            if let view = currentView as? ToastView {
                NSObject.cancelPreviousPerformRequests(withTarget: view)
                view.removeFromSuperview()
            }
        }
        
        let labelFrame = CGRect(x: parentView.frame.origin.x + hLabelGap,
                                y: parentView.frame.origin.y + vLabelGap,
                                width: parentView.frame.width - 2 * hLabelGap,
                                height: parentView.frame.height - 2 * vLabelGap)
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.text = text
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.frame = labelFrame
        label.sizeToFit()
        
        let toast = ToastView()
        toast.textLabel = label
        toast.addSubview(label)
        
            toast.frame = CGRect(x: parentView.frame.origin.x,
                                 y: 0.0,
                                 width: parentView.frame.size.width,
                                 height: label.frame.height * 2)
        
        toast.backgroundColor = UIColor.init(red: 44.0/255.0, green: 42.0/255.0, blue: 45.0/255.0, alpha: 1)
        toast.alpha = 1.0
        toast.center = CGPoint(x: parentView.center.x, y: vToastGap - 0.5)
        label.center = CGPoint(x: toast.frame.size.width / 2, y: toast.frame.size.height / 2)
        
        parentView.addSubview(toast)
        
        UIView.animate(withDuration: 0.4, animations: {
            toast.alpha = 1
            label.alpha = 1
        })
        
        toast.perform(#selector(hideSelf), with: nil, afterDelay: duration)
    }
    
    @objc private func hideSelf() {
        UIView.animate(withDuration: 0.4, animations: {
            self.alpha = 0.0
            self.textLabel.alpha = 0.0
        }, completion: { t in self.removeFromSuperview() })
    }
}

