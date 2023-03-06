import Foundation
import UIKit

enum Errors: Error {
    case problemInBack
}

final class ModelDetail {
    
    enum URLs {
        static let barcode = "http://event.surfstudio.ru:8082/led/barcode/"
    }
    
    func takeRequest(header: String, completion: @escaping (Result<Info, Error>) -> ()) {
        guard let url = URL(string: URLs.barcode + header) else {
            completion(.failure(Errors.problemInBack))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            guard let parsed = try? JSONDecoder().decode(Info.self, from: data) else {
                completion(.failure(Errors.problemInBack))
                return
            }
            completion(.success(parsed))
        }.resume()
    }
}

// MARK: - Info
struct Info: Codable {
    let image: String
    let model, brand: String?
    let rating: Double?
    let life, price, voltage: String?
    let temp, brightness, usage, power: Brightness?
}

// MARK: - Brightness
struct Brightness: Codable {
    let declared, measured: String?
}
