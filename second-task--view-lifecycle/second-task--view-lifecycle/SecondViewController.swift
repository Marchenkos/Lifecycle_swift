import UIKit

class SecondViewController: ViewControllerLifecycleLogger {
    private enum Constants {
        static let screenName = "SecondViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setScreenName(screenName: Constants.screenName)
    }
}
