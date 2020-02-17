import SwiftUI

final class BookStore: ObservableObject {
    @Published
    var books: Books = Books.makeDummy
    
    @Published
    var selectedIndex: Int = 0
}
