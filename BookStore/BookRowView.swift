//
//  BookRowView.swift
//  BookStore
//
//  Created by Thiago Holanda on 17.02.20.
//  Copyright © 2020 unnamedd.codes. All rights reserved.
//

import SwiftUI

struct BookRowView: View {
    let book: Book
    let isSelected: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(book.title)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.leading, 10)
                    .padding(.vertical, 3)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .background(isSelected ? Color.secondary : Color.clear)
        }
        .padding(.vertical, 1)
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
        let books = Books.makeDummy
        let book = books[0]
        
        return Group {
            BookRowView(book: book, isSelected: true)
            BookRowView(book: book, isSelected: false)
        }
    }
}
