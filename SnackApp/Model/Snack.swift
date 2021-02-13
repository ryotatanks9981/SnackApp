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


struct Event: Decodable, Identifiable {
    var id: Int
    var title: String
    var subTitle: String
    var eventUrl: String
    var hashTag: String
    var startDate: String
    var endDate: String
    var place: String
    var address: String
    var lat: String?
    var lon: String?
    var ownerDisplayName: String

    enum CodingKeys: String, CodingKey {
        case id = "event_id"
        case title = "title"
        case subTitle = "catch"
        case eventUrl = "event_url"
        case hashTag = "hash_tag"
        case startDate = "started_at"
        case endDate = "ended_at"
        case place = "place"
        case address = "address"
        case lat = "lat"
        case lon = "lon"
        case ownerDisplayName = "owner_display_name"
    }
}

struct StudyGroup: Decodable {
    var events: [Event]
}
