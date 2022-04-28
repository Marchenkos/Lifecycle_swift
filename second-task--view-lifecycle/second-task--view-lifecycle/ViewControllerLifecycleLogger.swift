import UIKit

 class ViewControllerLifecycleLogger: UIViewController {
    var screenName: String?
    var appearTime: Date = Date()
    var duration: Int = 0

    private enum Constants {
        static let dateFormat = "MM-dd-yyyy HH:mm:ss"
        static let undefinedScreenName = "undefinedScreenName"
    }

    func setScreenName(screenName: String) {
        self.screenName = screenName
    }

    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat

        return formatter.string(from: date)
    }
 }

extension ViewControllerLifecycleLogger {
    var logger: Logger { Logger() }
    
    override func viewDidDisappear(_ animated: Bool) {
        logger.logOnViewDidDisappear(appearTime: appearTime, screenName: screenName)
    }

    override func viewDidAppear(_ animated: Bool) {
        appearTime = Date()
        logger.logOnViewDidAppear(appearTime: appearTime, screenName: screenName)
    }
}
