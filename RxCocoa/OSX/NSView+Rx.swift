//
//  NSView+Rx.swift
//  Rx
//
//  Created by Krunoslav Zaher on 12/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
import Cocoa
#if !RX_NO_MODULE
import RxSwift
#endif

extension NSView {
    /**
     Bindable sink for `hidden` property.
     */
    public var rx_hidden: Drivable<Bool> {
        return Drivable { [weak self] value in
            self?.hidden = value
        }
    }

    /**
     Bindable sink for `alphaValue` property.
     */
    public var rx_alpha: Drivable<CGFloat> {
        return Drivable { [weak self] value in
            self?.alphaValue = value
        }
    }
}