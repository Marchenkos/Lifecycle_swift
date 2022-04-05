import Foundation

class Session {
    var sessionId: Int
    var startDate: Date?
    var duration: Int = 0

    init(sessionId: Int) {
        self.sessionId = sessionId
    }

    func startSession() {
        startDate = Date()
    }

    func endSession() {
        guard let start = startDate else {
            print("Session wasn't started")
            return
        }

        duration = Int(Date().timeIntervalSince(start))
    }

    func getSessionInfo() -> SessionInfo {
        return SessionInfo(sessionId: self.sessionId, duration: self.duration)
    }
 }
