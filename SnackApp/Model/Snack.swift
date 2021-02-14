import Foundation

struct Item: Decodable {
    var item: [Snack]
}

struct Snack: Codable, Identifiable {
    let id: String
    let name: String
    let maker: String
    let image: String
    let comment: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case maker = "maker"
        case image = "image"
        case comment = "comment"
    }
}

