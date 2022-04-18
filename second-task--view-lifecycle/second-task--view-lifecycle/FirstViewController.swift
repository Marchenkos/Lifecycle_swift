import UIKit

class FirstViewController: AnalyticCotroller {
    private enum Constants {
        static let screenName = "FirstViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setScreeName(screenName: Constants.screenName)
    }
}
