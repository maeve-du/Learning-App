//
//  ContentView.swift
//  Learning App
//
//  Created by Mae on 2022/4/10.
//

import Foundation
import CoreImage

class ContentModel: ObservableObject {
    // list of modules
    @Published var modules = [Module]()
    
    // current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    // current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
    // MARK: - data method
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
    
    // MARK: - module navigation method
    
    func beginModule( _ moduleId:Int ) {
        
        // find the index for the module id
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                
                // find the macthing module
                currentModuleIndex = index
                break
            }
        }
        // set the current method
        currentModule = modules[currentModuleIndex]
        
    }
    
    // MARK: - lession navigation method
    
    func beginLesson( _ lessonIndex: Int ) {
        
        // check that the lesson index is within range of moduel lessons
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        // set the current lesson
        
        currentLesson  = currentModule!.content.lessons[currentLessonIndex]
    }
    
    
    func nextLesson() {
        
        currentLessonIndex += 1
        if currentLessonIndex < currentModule!.content.lessons.count {
            currentLesson = currentModule?.content.lessons[currentLessonIndex]
        }
        else {
            currentLessonIndex = 0
            currentLesson = nil
        }
        
    }
    
    func hasNextLesson() -> Bool {
     
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    
    }
}

