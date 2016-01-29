//
//  UIActivityIndicatorView+Rx.swift
//  Rx
//
//  Created by Ivan Persidskiy on 02/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

#if !RX_NO_MODULE
import RxSwift
#endif

extension UIActivityIndicatorView {

    /**
    Bindable sink for `startAnimating()`, `stopAnimating()` methods.
    */
    public var rx_animating: Drivable<Bool> {
        return Drivable { value in
            if value {
                self.startAnimating()
            } else {
                self.stopAnimating()
            }
        }
    }
}

#endif
