//
//  HomeView.swift
//  Learning App
//
//  Created by Mae on 2022/4/10.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                
                Text("What do you want to do today")
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { module in
                            VStack(spacing: 0) {
                                // learning card
                                Card(image: module.content.image, title: "Learn " +  module.category, description: module.content.description, count: String(module.content.lessons.count), time: module.content.time)
                                
                                // test card
                                Card(image: module.test.image, title: module.category + " Test", description: module.test.description, count: String(module.test.questions.count), time: module.test.time)
                            }
                        }
                    }//: LazyVStack
                }//: ScrollView
            }//: VStack
            .navigationTitle("Get Started")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13 Pro")
            .environmentObject(ContentModel())
    }
}
