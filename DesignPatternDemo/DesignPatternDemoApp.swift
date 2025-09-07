//
//  DesignPatternDemoApp.swift
//  DesignPatternDemo
//
//  Created by LIJIANFEI on 7/9/25.
//

import SwiftUI

@main
struct DesignPatternDemoApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DataStructuresView()
                    .tabItem {
                        Label("数据结构", systemImage: "list.bullet")
                    }
                
                DesignPatternsView()
                    .tabItem {
                        Label("设计模式", systemImage: "puzzlepiece")
                    }
            }
        }
    }
}
