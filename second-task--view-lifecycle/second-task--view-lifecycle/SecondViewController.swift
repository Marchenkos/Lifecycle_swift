import UIKit

class SecondViewController: AnalyticCotrollerLogged {
    private enum Constants {
        static let screenName = "SecondViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setScreenName(screenName: Constants.screenName)
    }
}
