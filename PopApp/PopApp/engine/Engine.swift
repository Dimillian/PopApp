//
//  Engine.swift
//  PopApp
//
//  Created by Thomas Ricouard on 22/07/2018.
//  Copyright © 2018 Thomas Ricouard. All rights reserved.
//

import Foundation

public class Engine {
    static public let main = Engine()

    fileprivate var runLoop: DispatchSourceTimer?
    fileprivate let runLoopQueue = DispatchQueue(label: "popapp.engine",
                                   qos: DispatchQoS.userInteractive)

    init() {

    }

    public func start() {
        if runLoop != nil {
            runLoop?.suspend()
            runLoop?.cancel()
            runLoop = nil
        }
        runLoop = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: 0),
                                                   queue: runLoopQueue)
        runLoop?.schedule(deadline: .now(), repeating: 0.1)
        runLoop?.setEventHandler(handler: {
            self.update()
        })
        runLoop?.resume()
    }

    public func stop() {
        runLoop?.suspend()
    }

    fileprivate func update() {
        print("Update")
    }
}
