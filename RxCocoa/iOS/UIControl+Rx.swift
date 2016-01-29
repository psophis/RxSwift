//
//  UIControl+Rx.swift
//  RxCocoa
//
//  Created by Daniel Tartaglia on 5/23/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension UIControl {
    
    /**
    Bindable sink for `enabled` property.
    */
    public var rx_enabled: Drivable<Bool> {
        return Drivable { [weak self] value in
            self?.enabled = value
        }
    }

    /**
    Reactive wrapper for target action pattern.
    
    - parameter controlEvents: Filter for observed event types.
    */
    public func rx_controlEvent(controlEvents: UIControlEvents) -> ControlEvent<Void> {
        let source: Observable<Void> = Observable.create { [weak self] observer in
            MainScheduler.ensureExecutingOnScheduler()

            guard let control = self else {
                observer.on(.Completed)
                return NopDisposable.instance
            }

            let controlTarget = ControlTarget(control: control, controlEvents: controlEvents) {
                control in
                observer.on(.Next())
            }
            
            return AnonymousDisposable {
                controlTarget.dispose()
            }
        }.takeUntil(rx_deallocated)
        
        return ControlEvent(events: source)
    }

    func rx_value<T: Equatable>(getter getter: () -> T, setter: T -> Void) -> ControlProperty<T> {
        let source: Observable<T> = Observable.create { [weak self] observer in
            guard let control = self else {
                observer.on(.Completed)
                return NopDisposable.instance
            }

            observer.on(.Next(getter()))

            let controlTarget = ControlTarget(control: control, controlEvents: [.AllEditingEvents, .ValueChanged]) { control in
                observer.on(.Next(getter()))
            }
            
            return AnonymousDisposable {
                controlTarget.dispose()
            }
        }
            .distinctUntilChanged()
            .takeUntil(rx_deallocated)
        
        return ControlProperty<T>(values: source, valueSink: Drivable { value in
            setter(value)
        })
    }

}

#endif
