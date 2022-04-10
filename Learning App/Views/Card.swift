//
//  Card.swift
//  Learning App
//
//  Created by Mae on 2022/4/10.
//

import SwiftUI

struct Card: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack {
            //bg
            Rectangle()
                .cornerRadius(16)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: -2, y: 5)
            // card content
            HStack(spacing: 20.0) {
                // card left side
                Image(image)
                    .resizable()
                    .frame(width: 108, height: 108, alignment: .center)
                    .clipShape(Circle())
                // card right side
                VStack(alignment: .leading) {
                    // right top
                    VStack(alignment: .leading, spacing: 4.0) {
                        Text(title)
                            .font(.title3)
                            .fontWeight(.bold)
                        Text(description)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                    }//: right top
                    Spacer()
                    // right bottom
                    HStack(spacing: 16.0) {
                        HStack(spacing: 4.0) {
                            Image(systemName: "text.book.closed")
                            Text("\(count) Lessons")
                        }
                        HStack(spacing: 4.0)  {
                            Image(systemName: "clock")
                            Text(time)
                        }
                    }//: right bottom
                    .font(.footnote)
                    .foregroundColor(.secondary)
                } //: card right side
                .padding(.vertical,20)
            }
            .padding()
//            .foregroundColor(.black)
            .accentColor(.black)
        }//: card
        .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
        .padding()
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(image: "swift", title: "Learn Swift", description: "some text some text some text some text", count: "20", time: "30 Hours")
    }
}
