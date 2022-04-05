import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var documentManager: DocumentManager?
    var currentSession: Session?

    private enum Constants {
        static let sessionFileName = "sessionInfo"
        static let sessionErrorMessage = "Session wasn't started"
        static let sessionFileExtension = "json"
        static let firstSessionId = 1
    }

    // Launch
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        documentManager = DocumentManager()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onStartSession(_:)), name: .onStartSession, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onFinishSession(_:)), name: .onFinishSession, object: nil)

        return
    }

    // Close
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    // Unlock
    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    // Minimize
    func sceneWillResignActive(_ scene: UIScene) {
        guard let session = currentSession else {
            print(Constants.sessionErrorMessage)

            return
        }

        if let existedDocumentManager = documentManager {
            let sessionInfo = session.endSession()

            NotificationCenter.default.post(name: .onFinishSession, object: nil, userInfo: sessionInfo.convertToDict())

            existedDocumentManager.saveData(content: sessionInfo, fileName: Constants.sessionFileName, fileExtension: Constants.sessionFileExtension)
        }
    }

    // Maximize
    func sceneWillEnterForeground(_ scene: UIScene) {
        NotificationCenter.default.post(name: .onStartSession, object: nil)
        
        if let existedDocumentManager = documentManager {
           let savedSessionInfo = existedDocumentManager.read(fileName: Constants.sessionFileName, fileExtension: Constants.sessionFileExtension)

            guard let savedSession = savedSessionInfo, let lastSession = savedSessionInfo?.last else {
                createNewSession(sessionId: Constants.firstSessionId)

                return
            }

            NotificationCenter.default.post(name: .onStartSession, object: nil, userInfo: ["savedSession": savedSession])

            createNewSession(sessionId: lastSession.sessionId + 1)
        }
    }

    // Lock
    func sceneDidEnterBackground(_ scene: UIScene) {
    }

    func createNewSession(sessionId: Int) {
        let newSession = Session(sessionId: sessionId)

        currentSession = newSession
    }
    
    @objc func onFinishSession(_ notification: Notification) {
        if let startDate = notification.userInfo?["startDate"], let duration = notification.userInfo?["duration"] {

            print("Session finished! Started at \(startDate), duration \(duration) sec")
        }
    }
    
    @objc func onStartSession(_ notification: Notification) {
        if let savedSession = notification.userInfo?["savedSession"] as? [SessionInfo] {
            let sessionDurations = savedSession.map({$0.duration })
            let totalDuration = sessionDurations.reduce(0, +)

            print("Number of sessions - \(savedSession.count), duration -  \(totalDuration) sec")
        }
    }
}
