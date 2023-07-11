//
// Locking.swift
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

// MARK: - Locking

/// Master recursive lock
internal var globalRecursiveLock = RecursiveLock.shared

 ///Custom recursive lock class
//internal final class RecursiveLock: NSLocking {
//
//    static let shared = RecursiveLock()
//
//    init() {
//        let mutexAttr = UnsafeMutablePointer<pthread_mutexattr_t>.allocate(capacity: 1)
//        pthread_mutexattr_init(mutexAttr)
//        pthread_mutexattr_settype(mutexAttr, Int32(PTHREAD_MUTEX_RECURSIVE))
//        mutex = UnsafeMutablePointer<pthread_mutex_t>.allocate(capacity: 1)
//        pthread_mutex_init(mutex, mutexAttr)
//        pthread_mutexattr_destroy(mutexAttr)
//        mutexAttr.deallocate()
//    }
//
//    deinit {
//        pthread_mutex_destroy(mutex)
//        mutex.deallocate()
//    }
//
//    @inlinable func lock() {
//        pthread_mutex_lock(mutex)
//    }
//
//    @inlinable func unlock() {
//        pthread_mutex_unlock(mutex)
//    }
//
//    private var mutex: UnsafeMutablePointer<pthread_mutex_t>
//
//}

//internal final class RecursiveLock {
//    private var _lock: os_unfair_lock_t
//
//    init() {
//        _lock = UnsafeMutablePointer<os_unfair_lock>.allocate(capacity: 1)
//        _lock.initialize(to: os_unfair_lock())
//    }
//
//    deinit {
//        _lock.deallocate()
//    }
//
//
//    @inlinable func lock() {
//        os_unfair_lock_lock(_lock)
//    }
//
//    @inlinable func unlock() {
//        os_unfair_lock_unlock(_lock)
//    }
//    //
//    //    private var mutex: UnsafeMutablePointer<pthread_mutex_t>
//
//}
//
internal final class RecursiveLock {
    private let recursiveLock = NSRecursiveLock()

    static let shared = RecursiveLock()
    private init() {

    }

    deinit {
    }


    @inlinable func lock() {
        recursiveLock.lock()
    }

    @inlinable func unlock() {
        recursiveLock.unlock()
    }
    //
    //    private var mutex: UnsafeMutablePointer<pthread_mutex_t>

}

//internal final class RecursiveLock {
//    let nslock = NSLock()
//
//    init() {
//
//    }
//
//    deinit {
//    }
//
//
//    @inlinable func lock() {
//        nslock.lock()
//    }
//
//    @inlinable func unlock() {
//        nslock.unlock()
//    }
//    //
//    //    private var mutex: UnsafeMutablePointer<pthread_mutex_t>
//
//}
