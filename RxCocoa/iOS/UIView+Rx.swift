//
//  UIView+Rx.swift
//  Rx
//
//  Created by Krunoslav Zaher on 12/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
import UIKit
#if !RX_NO_MODULE
import RxSwift
#endif

extension UIView {
    /**
     Bindable sink for `hidden` property.
     */
    public var rx_hidden: Drivable<Bool> {
        return Drivable { [weak self] value in
            self?.hidden = value
        }
    }

    /**
     Bindable sink for `alpha` property.
     */
    public var rx_alpha: Drivable<CGFloat> {
        return Drivable { [weak self] value in
            self?.alpha = value
        }
    }
}

#endif
