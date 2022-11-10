//
//  AnyCrashTest.swift
//  AnyTest
//
//  Created by Siemian on 09/11/2022.
//

import Foundation

public protocol Provider<T> {
    associatedtype T: Decodable
    func fetchObject() -> T
}

public final class DefaultProvider: Provider {
    public typealias T = String

    public func fetchObject() -> String {
        "fixture"
    }
}

public final class AnyCrashTest {

    let provider: any Provider<String>

    public convenience init() {
        self.init(test: "")
    }

    init(test: String, provider: any Provider<String> = DefaultProvider()) {
        self.provider = provider
    }
}
