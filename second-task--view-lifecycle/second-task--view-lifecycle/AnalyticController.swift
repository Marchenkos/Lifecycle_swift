import UIKit

 class AnalyticController: UIViewController {
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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.startTime = Date()
    }

    override func viewDidDisappear(_ animated: Bool) {
        duration = Int(Date().timeIntervalSince(startTime))
        print("Screen \(screenName ?? Constants.undefinedScreenName) disapeared... duration: \(duration)sec")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("Screen \(screenName ?? Constants.undefinedScreenName) apeared. Appear time: \(formatDate(date: Date()))")
    }
 }
