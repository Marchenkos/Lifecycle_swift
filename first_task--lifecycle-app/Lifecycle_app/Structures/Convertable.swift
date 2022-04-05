import Foundation

protocol Convertable: Codable {}

extension Convertable {
    func convertToDict() -> [String: Any]? {
        var dict: [String: Any]?

        do {
            let encoder = JSONEncoder()

            let data = try encoder.encode(self)

            dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        } catch {
            print(error)
        }

        return dict
    }
}
