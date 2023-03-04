import Foundation

final class ModelDetail {
    var info: Info? {
        didSet {
            
        }
    }
    
    enum URLs {
        static let barcode = "http://event.surfstudio.ru:8082/led/barcode/"
    }
    
    func takeRequest(header: String, completion: @escaping (Result<Info, Error>) -> ()) {
        guard let url = URL(string: URLs.barcode + header) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            guard let parsed = try? JSONDecoder().decode(Info.self, from: data) else {
                return
            }
            completion(.success(parsed))
        }.resume()
    }
}

struct Info: Codable {
    let image: String
    let model, brand: String
    let rating: Int
    let temp, brightness, usage, power: Brightness
}

struct Brightness: Codable {
    let declared, measured: String
}
