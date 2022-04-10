//
//  Learning_App.swift
//  Learning App
//
//  Created by Mae on 2022/4/10.
//

import SwiftUI

@main
struct Learning_App: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
