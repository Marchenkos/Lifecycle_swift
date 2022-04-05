import Foundation

struct DocumentManager {
    func getDocumentDirectoryPath() -> URL {
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

        return directoryURL
    }

    func appendPath(fileName: String) -> URL {
        var directoryURL = getDocumentDirectoryPath()
        directoryURL.appendPathComponent(fileName)

        return directoryURL
    }

    func read(fileName: String, fileExtension: String?) -> [SessionInfo]? {
        let directoryURL = getDocumentDirectoryPath()
        let fileURL = URL(fileURLWithPath: fileName, relativeTo: directoryURL).appendingPathExtension(fileExtension ?? "txt")

        do {
            let savedData = try Data(contentsOf: fileURL)

            let sessionContent = try? JSONDecoder().decode([SessionInfo].self, from: savedData)

            return sessionContent
        } catch {
            print("Unable to read the file")
        }

        return nil
    }

    func saveData(content: SessionInfo, fileName: String, fileExtension: String?) {
        let directoryURL = getDocumentDirectoryPath()
        let fileURL = URL(fileURLWithPath: fileName, relativeTo: directoryURL).appendingPathExtension(fileExtension ?? "txt")
        let encoder = JSONEncoder()

        let savedContent: [SessionInfo]? = read(fileName: fileName, fileExtension: fileExtension)

        do {
            if var savedSessions = savedContent {
                savedSessions.append(content)

                let encodedData = try encoder.encode(savedSessions)
                try encodedData.write(to: fileURL, options: .noFileProtection)

                return
            }

            let ses = try encoder.encode([content])

            try ses.write(to: fileURL, options: .noFileProtection)
        } catch {
            print("Error...Cannot save data!!!See error: \(error.localizedDescription)")
        }
    }
 }
