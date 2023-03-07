import Foundation
import OpenAIReTreeable

@available(swift 5.5)
@available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
public struct Nitka {
    let api: OpenAIReTreeable

    public init() {
        guard let authToken = ProcessInfo.processInfo.environment["OPENAI_TOKEN"] else {
            fatalError("OPENAI_TOKEN env variable is not set")
        }
        api = OpenAIReTreeable(authToken: authToken)
    }
}
