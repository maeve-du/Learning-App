//
//  ContentListRow.swift
//  Learning App
//
//  Created by Mae on 2022/4/10.
//

import SwiftUI

struct ContentListRow: View {
    
    var itemIndex: Int
    var itemTitle: String
    var itemTime: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .cornerRadius(8)
                .foregroundColor(.white)
                .frame(height: 100)
               
            HStack(spacing: 30) {
                Text(String(itemIndex))
                    .font(.title)
                VStack(alignment: .leading, spacing: 8) {
                    Text(itemTitle)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("video - \(itemTime)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal,30)

        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .shadow(color: .black.opacity(0.2), radius: 5, x: -1, y: 3)
        .accentColor(.black)
//                .frame(height: 66)
       
    }
}

struct ContentListCard_Previews: PreviewProvider {

    static var previews: some View {
        ContentListRow(itemIndex: 1, itemTitle: "Long large title", itemTime: "100 minutes")
    }
}
