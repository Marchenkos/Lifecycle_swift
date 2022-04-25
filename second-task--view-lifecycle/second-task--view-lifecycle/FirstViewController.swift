import UIKit

class FirstViewController: AnalyticCotrollerLogged {
    private enum Constants {
        static let screenName = "FirstViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setScreenName(screenName: Constants.screenName)
    }
}
