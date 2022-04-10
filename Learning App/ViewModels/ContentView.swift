//
//  ContentView.swift
//  Learning App
//
//  Created by Mae on 2022/4/10.
//

import Foundation
import CoreImage

class ContentModel: ObservableObject {
    @Published var modules = [Module]()
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        // get a url to the  json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // read the file into data object
            let jsonData = try Data(contentsOf: jsonUrl! )
            
            // try to decode the json onto an array of module
            // and assign parsed modules to modules property
            let jsonDecoder = JSONDecoder()
            self.modules =  try jsonDecoder.decode([Module].self, from: jsonData)
        }
        catch {
            print("Couldn't parse local data")
        }
        
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            self.styleData  = try Data(contentsOf: styleUrl!)

        }
        catch {
            print("Couldn't parse style data")
        }
        
    }
    
}

