import UIKit

class SecondViewController: AnalyticController {
    private enum Constants {
        static let screenName = "SecondViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setScreenName(screenName: Constants.screenName)
    }
}
