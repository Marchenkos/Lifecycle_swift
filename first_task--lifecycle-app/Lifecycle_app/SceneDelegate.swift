import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var documentManager: DocumentManager?
    var currentSession: Session?

    private enum Constants {
        static let sessionFileName = "sessionInfo"
        static let sessionFileExtension = "json"
        static let firstSessionId = 1
    }

    // Launch
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        documentManager = DocumentManager()

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
        guard let session = currentSession, let sessionStartDate = currentSession?.startDate else {
            print("Session wasn't started")

            return
        }

        if let existedDocumentManager = documentManager {
            session.endSession()
            let sessionInfo = session.getSessionInfo()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            let sessionStart = formatter.string(from: sessionStartDate)

            print("Session finished! Started at \(sessionStart), duration \(session.duration) sec")

            existedDocumentManager.saveData(content: sessionInfo, fileName: Constants.sessionFileName, fileExtension: Constants.sessionFileExtension)
        }
    }

    // Maximize
    func sceneWillEnterForeground(_ scene: UIScene) {
        if let existedDocumentManager = documentManager {
           let savedSessionInfo = existedDocumentManager.read(fileName: Constants.sessionFileName, fileExtension: Constants.sessionFileExtension)

            guard let savedSession = savedSessionInfo, let lastSession = savedSessionInfo?.last else {
                createNewSession(sessionId: Constants.firstSessionId)

                return
            }

            let sessionDurations = savedSession.map({$0.duration })
            let totalDuration = sessionDurations.reduce(0, +)

            print("Number of sessions - \(savedSession.count), duration -  \(totalDuration) sec")

            createNewSession(sessionId: lastSession.sessionId + 1)
        }
    }

    // Lock
    func sceneDidEnterBackground(_ scene: UIScene) {
    }

    func createNewSession(sessionId: Int) {
        let newSession = Session(sessionId: sessionId)
        newSession.startSession()

        currentSession = newSession
    }
}
