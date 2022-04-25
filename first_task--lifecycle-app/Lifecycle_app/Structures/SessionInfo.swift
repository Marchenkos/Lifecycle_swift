import Foundation

struct SessionInfo {
    let sessionId: Int
    let duration: Int
    let startDate: String
}

extension SessionInfo: Decodable, Encodable {}

extension SessionInfo: Convertable {}
