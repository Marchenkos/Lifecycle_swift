import UIKit

 class AnalyticCotrollerLogged: UIViewController {
    var screenName: String?
    var startTime: Date = Date()
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

extension AnalyticCotrollerLogged {
    var logger: Logger { Logger() }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.startTime = Date()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        logger.logOnViewDidDisappear(startTime: startTime, screenName: screenName)
    }

    override func viewDidAppear(_ animated: Bool) {
        logger.logOnViewDidAppear(screenName: screenName)
    }
}
