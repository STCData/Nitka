
import OpenAISwift

@available(swift 5.5)
@available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
public struct OpenAIReTreeable {
    private var openAI: OpenAISwift
    public init(authToken: String) {
        openAI = OpenAISwift(authToken: authToken)
    }

    public func send(messages: [ChatMessage]) async throws -> ChatMessage {
        do {
            let result = try await openAI.sendChat(with: messages)

            guard let message = result.choices.first?.message else {
                throw OpenAIReTreeableError.noMessage
            }
            return message

        } catch OpenAIError.decodingError {
            throw OpenAIReTreeableError.decodingError
        }
    }
}
