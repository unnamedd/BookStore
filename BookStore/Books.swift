import Foundation

typealias Books = [Book]

extension Books {
    static var makeDummy: Books {
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "Books", withExtension: "json") else {
            print("Error: File doesn't exist")
            return []
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("Error: Data of \(url) isn't readable")
            return []
        }
        
        guard let content = try? JSONDecoder().decode([Book].self, from: data) else {
            print("Error: Content wasn't convertable")
            return []
        }
        
        return content
    }
}
