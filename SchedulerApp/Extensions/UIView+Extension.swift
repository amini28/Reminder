//
//  UIView+Extension.swift
//  SchedulerApp
//
//  Created by Amini on 26/07/22.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
