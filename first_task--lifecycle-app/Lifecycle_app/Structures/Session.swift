import Foundation

class Session {
    var sessionId: Int
    var startDate: Date
    var duration: Int = 0
    
    private enum Constants {
        static let dateFormat = "MM-dd-yyyy HH:mm"
    }

    init(sessionId: Int) {
        self.sessionId = sessionId
        self.startDate = Date()
    }

    func endSession() -> SessionInfo {
        duration = Int(Date().timeIntervalSince(startDate))
        
        return SessionInfo(sessionId: self.sessionId, duration: self.duration, startDate: formatStartDate())
    }
    
    func formatStartDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat

        return formatter.string(from: startDate)
    }
 }
