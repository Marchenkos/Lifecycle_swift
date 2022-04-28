import UIKit

class FirstViewController: AnalyticController {
    private enum Constants {
        static let screenName = "FirstViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setScreenName(screenName: Constants.screenName)
    }
}
