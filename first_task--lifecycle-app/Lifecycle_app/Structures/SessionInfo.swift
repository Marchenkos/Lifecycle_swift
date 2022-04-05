import Foundation

struct SessionInfo {
    let sessionId: Int
    let duration: Int
}

extension SessionInfo: Decodable, Encodable {}
