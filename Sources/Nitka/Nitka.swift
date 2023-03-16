import CLISpinner
import Foundation
import OpenAIReTreeable
import OpenAISwift

@available(swift 5.5)
@available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
public struct Nitka {
    let api: OpenAIReTreeable

    public init() {
        guard let authToken = ProcessInfo.processInfo.environment["OPENAI_API_KEY"] else {
            fatalError("OPENAI_TOKEN env variable is not set")
        }
        api = OpenAIReTreeable(authToken: authToken)
    }

    private var isUnitTesting: Bool {
        ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }

    private func runWithSpinner(_ runnable: @escaping () async -> Void) {
        let s = Spinner(pattern: .dots)
        if !isUnitTesting {
            s.start()
        }

        let group = DispatchGroup()
        group.enter()

        DispatchQueue.global(qos: .default).async {
            Task {
                _ = await runnable()
                group.leave()
            }
        }
        group.wait()
        if !isUnitTesting {
            s.stop()
        }
    }

    public func newChat(startMessage: String) {
        let msgs = [
            ChatMessage(role: .system, content: ""),
            ChatMessage(role: .user, content: startMessage),
        ]
        runWithSpinner {
            do {
                let resp = try await api.send(messages: msgs)
                print(resp)
            } catch OpenAIReTreeableError.noMessage {
                fatalError("no message returned!")
            } catch {
                fatalError("weird error!")
            }
        }
    }
}
