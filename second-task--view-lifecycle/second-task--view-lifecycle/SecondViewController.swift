import UIKit

class SecondViewController: AnalyticCotroller {
    private enum Constants {
        static let screenName = "SecondViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setScreeName(screenName: Constants.screenName)
    }
}
