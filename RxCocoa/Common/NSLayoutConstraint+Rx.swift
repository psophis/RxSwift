//
//  NSLayoutConstraint+Rx.swift
//  Rx
//
//  Created by Krunoslav Zaher on 12/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

#if os(OSX)
import Cocoa
#else
import UIKit
#endif

#if !RX_NO_MODULE
import RxSwift
#endif

#if os(iOS) || os(OSX) || os(tvOS)
extension NSLayoutConstraint {
    /**
     Bindable sink for `constant` property.
     */
    public var rx_constant: Drivable<CGFloat> {
        return Drivable { [weak self] value in
            self?.constant = value
        }
    }
    
    /**
     Bindable sink for `active` property.
     */
    @available(iOS 8, OSX 10.10, *)
    public var rx_active: Drivable<Bool> {
        return Drivable { [weak self] value in
            self?.active = value

        }
    }
}

#endif
