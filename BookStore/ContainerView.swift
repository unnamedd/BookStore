//
//  ContainerView.swift
//  BookStore
//
//  Created by Thiago Holanda on 17.02.20.
//  Copyright © 2020 unnamedd.codes. All rights reserved.
//

import SwiftUI

struct ContainerView: View {
    @ObservedObject
    private var bookStore: BookStore
    
    init(store: BookStore) {
        self.bookStore = store
    }
    
    var body: some View {
        let bookContentBinding = Binding<String>(
            get: {
                let index = self.bookStore.selectedIndex
                let book = self.bookStore.books[index]

                return book.title
            },
            set: {
                let index = self.bookStore.selectedIndex
                var book = self.bookStore.books[index]

                book.title = $0
                
                self.bookStore.books[index] = book
            }
        )

        return HSplitView {
            List {
                ForEach(self.bookStore.books.enumerated().map({ $0 }), id: \.element.id) { index, book in
                    Text(book.title)
                        .onTapGesture {
                            self.bookStore.selectedIndex = index
                    }
                }
            }
            .frame(
                minWidth: 300,
                maxWidth: 400,
                maxHeight: .infinity
            )
            
            MacEditorTextView(text: bookContentBinding)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}
    


struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        return ContainerView(
            store: BookStore()
        )
    }
}
