//
//  UILabel+Rx.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 4/1/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension UILabel {
    
    /**
    Bindable sink for `text` property.
    */
    public var rx_text: Drivable<String> {
        return Drivable { [weak self] value in
            self?.text = value
        }
    }

    /**
    Bindable sink for `attributedText` property.
    */
    public var rx_attributedText: Drivable<NSAttributedString?> {
        return Drivable { [weak self] value in
            self?.attributedText = value
        }
    }
    
}

#endif
