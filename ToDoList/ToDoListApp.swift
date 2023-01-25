//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Adil Mir on 24/01/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
	@StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
			NavigationView {
				ListView()
			}
			.navigationViewStyle(.stack)
			.tint(.yellow)
			.environmentObject(listViewModel)
        }
    }
}
