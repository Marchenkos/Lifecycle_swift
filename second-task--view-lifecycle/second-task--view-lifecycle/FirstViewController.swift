import UIKit

class FirstViewController: ViewControllerLifecycleLogger {
    private enum Constants {
        static let screenName = "FirstViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setScreenName(screenName: Constants.screenName)
    }
}
