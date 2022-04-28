import UIKit

 class AnalyticController: UIViewController {
    let lifecycleLogger = ViewControllerLifecycleLogger()

    private enum Constants {
        static let dateFormat = "MM-dd-yyyy HH:mm:ss"
        static let undefinedScreenName = "undefinedScreenName"
    }

    func setScreenName(screenName: String) {
        lifecycleLogger.screenName = screenName
    }

    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat

        return formatter.string(from: date)
    }

    override func viewDidDisappear(_ animated: Bool) {
        let duration = Int(Date().timeIntervalSince(lifecycleLogger.appearTime))

        print("Screen \(lifecycleLogger.screenName ?? Constants.undefinedScreenName) disapeared... duration: \(duration)sec")
    }

    override func viewDidAppear(_ animated: Bool) {
        lifecycleLogger.appearTime = Date()

        print("Screen \(lifecycleLogger.screenName ?? Constants.undefinedScreenName) apeared. Appear time: \(formatDate(date: lifecycleLogger.appearTime))")
    }
 }
