import Foundation
import UIKit

class Logger {
    private enum Constants {
        static let dateFormat = "MM-dd-yyyy HH:mm:ss"
        static let undefinedScreenName = "undefinedScreenName"
    }

    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat

        return formatter.string(from: date)
    }
    
    func logOnViewDidDisappear(startTime: Date, screenName: String?) {
        let duration = Int(Date().timeIntervalSince(startTime))
        print("Screen \(screenName ?? Constants.undefinedScreenName) disapeared... duration: \(duration)sec")
    }
    
    func logOnViewDidAppear(screenName: String?) {
        print("Screen \(screenName ?? Constants.undefinedScreenName) apeared. StartTime: \(formatDate(date: Date()))")
    }
}
