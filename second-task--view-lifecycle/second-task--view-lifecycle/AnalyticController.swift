import UIKit

 class AnalyticController: UIViewController {
    let lifecycleLogger = ViewControllerLifecycleLogger()

    func setScreenName(screenName: String) {
        lifecycleLogger.screenName = screenName
    }

    override func viewDidDisappear(_ animated: Bool) {
        let duration = Int(Date().timeIntervalSince(lifecycleLogger.appearTime))

        print("Screen \(lifecycleLogger.screenName ?? ViewControllerLifecycleLogger.Constants.undefinedScreenName) disapeared... duration: \(duration)sec")
    }

    override func viewDidAppear(_ animated: Bool) {
        lifecycleLogger.appearTime = Date()

        print("Screen \(lifecycleLogger.screenName ?? ViewControllerLifecycleLogger.Constants.undefinedScreenName) apeared.Appear time: \(lifecycleLogger.formatDate(date: lifecycleLogger.appearTime))")
    }
 }
