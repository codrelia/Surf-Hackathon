import Foundation

final class ModelDetail {
    var info: Info? {
        didSet {
            
        }
    }
    
    func takeRequest() {
        
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
