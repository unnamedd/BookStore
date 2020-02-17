import Foundation

struct Book: Codable, Identifiable {
    var id: String = UUID().uuidString
    var author: String
    var country: String
    var imageLink: String
    var language: String
    var link: String
    var pages: Int
    var title: String
    var year: Int
}

extension Book {
    private enum CodingKeys: String, CodingKey {
        case author
        case country
        case imageLink
        case language
        case link
        case pages
        case title
        case year
    }
}

extension Book: CustomStringConvertible {
    var description: String {
        return """
        \(title) (\(year))
        \n----------------------------------
        \nAuthor: \(author)
        \nLanguage: \(language)
        \nPages: \(pages)
        \nCountry: \(country)
        """
    }
}
