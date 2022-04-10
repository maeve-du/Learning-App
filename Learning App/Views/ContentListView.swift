//
//  ContentListView.swift
//  Learning App
//
//  Created by Mae on 2022/4/10.
//

import SwiftUI

struct ContentListView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self) { index in
                       
                        let lesson = model.currentModule!.content.lessons[index]
                        
                        ContentListRow(
                            itemIndex: index+1,
                            itemTitle: lesson.title,
                            itemTime: lesson.duration)
                    }
                }
               
            }
        }
        .navigationTitle("Learn \(model.currentModule?.category ?? "")")
    }
}

//struct ContentListView_Previews: PreviewProvider {
//    @EnvironmentObject var model: ContentModel
//
//    static var previews: some View {
//
//        ContentListView(model: ContentModel().modules[0])
//
//    }
//}
