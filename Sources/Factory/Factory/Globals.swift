//
// Globals.swift
//  
// GitHub Repo and Documentation: https://github.com/hmlongco/Factory
//
// Copyright © 2022 Michael Long. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import Foundation

//MARK: - Internal Variables

internal final class GlobalFactoryVariables: @unchecked Sendable {
    private var _globalGraphResolutionDepth = 0
    private var _globalResolverKey: StaticString = "*"
    private let lock = NSLock()

    #if DEBUG

    /// Internal variables used for debugging
    private var _globalDependencyChain: [String] = []
    private var _globalDependencyChainMessages: [String] = []
    private var _globalTraceFlag: Bool = false
    private var _globalTraceResolutions: [String] = []
    private var _globalLogger: (String) -> Void = { print($0) }
    private var _globalDebugInformationMap: [FactoryKey:FactoryDebugInformation] = [:]
    
    /// Triggers fatalError after resetting enough stuff so unit tests can continue
    internal func resetAndTriggerFatalError(_ message: String, _ file: StaticString, _ line: UInt) -> Never {
        globalDependencyChain = []
        globalDependencyChainMessages = []
        globalGraphResolutionDepth = 0
        globalTraceResolutions = []
        RecursiveLockManager.shared.unlockAll()
        triggerFatalError(message, file, line) // GOES BOOM
    }
    
    /// Allow unit test interception of any fatal errors that may occur running the circular dependency check
    /// Variation of solution: https://stackoverflow.com/questions/32873212/unit-test-fatalerror-in-swift#
    internal var triggerFatalError = Swift.fatalError
    #endif
 
    static let shared = GlobalFactoryVariables()
    
    private init() {}
    
    var globalGraphResolutionDepth: Int {
        get { lock.synchronized { _globalGraphResolutionDepth } }
        set { lock.synchronized { _globalGraphResolutionDepth = newValue } }
    }

    var globalResolverKey: StaticString {
        get { lock.synchronized { _globalResolverKey } }
        set { lock.synchronized { _globalResolverKey = newValue } }
    }
    
    var globalDependencyChain: [String] {
        get { lock.synchronized { _globalDependencyChain } }
        set { lock.synchronized { _globalDependencyChain = newValue } }
    }
    
    var globalDependencyChainMessages: [String] {
        get { lock.synchronized { _globalDependencyChainMessages } }
        set { lock.synchronized { _globalDependencyChainMessages = newValue } }
    }
    
    var globalTraceFlag: Bool {
        get { lock.synchronized { _globalTraceFlag } }
        set { lock.synchronized { _globalTraceFlag = newValue } }
    }
    
     var globalTraceResolutions: [String] {
        get { lock.synchronized { _globalTraceResolutions } }
        set { lock.synchronized { _globalTraceResolutions = newValue } }
    }
    
     var globalLogger: (String) -> Void {
        get { lock.synchronized { _globalLogger } }
        set { lock.synchronized { _globalLogger = newValue } }
    }
    
     var globalDebugInformationMap: [FactoryKey: FactoryDebugInformation] {
        get { lock.synchronized { _globalDebugInformationMap } }
        set { lock.synchronized { _globalDebugInformationMap = newValue } }
    }
}
