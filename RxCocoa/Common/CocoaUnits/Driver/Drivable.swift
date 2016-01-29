//
//  NextObserver.swift
//  Rx
//
//  Created by Thane Gill on 1/29/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif

public struct Drivable<Element>: ObserverType {
    /**
     The type of elements in sequence that observer can observe.
     */
    public typealias E = Element

    /**
     Anonymous event handler type.
     */
    public typealias EventHandler = (Event<Element>) -> Void

    public let observer: EventHandler

    /**
     Construct an instance whose `on(event)` calls `eventHandler(event)`

     - parameter eventHandler: Event handler that observes sequences events.
     */
    public init(nextEventHandler: (Element) -> ()) {
        self.observer = { event in
            switch event {
            case .Next(let value):
                nextEventHandler(value)
            case .Error(let error):
                bindingErrorToInterface(error)
            case .Completed:
                break
            }
        }
    }

    /**
     Send `event` to this observer.

     - parameter event: Event instance.
     */
    public func on(event: Event<Element>) {
        MainScheduler.ensureExecutingOnScheduler()
        switch event {
        case .Error(let error):
            bindingErrorToInterface(error)
        case .Next, .Completed:
            self.observer(event)
        }
    }

    /**
     Erases type of observer and returns canonical observer.

     - returns: type erased observer.
     */
    public func asObserver() -> Drivable<E> {
        return self
    }
}