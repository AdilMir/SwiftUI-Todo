//
//  DataController.swift
//  ToDoList
//
//  Created by Adil Mir on 25/01/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
	
	//NSPersistentContainer
	let container = NSPersistentContainer(name: "ToDoItem")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print(error.localizedDescription)
				return
			}
		}
		self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
	}
	
	func saveNewToDo(title: String) -> Bool {
		
		let todo = ToDoItem(context: container.viewContext)
		todo.id = UUID().uuidString
		todo.title = title
		todo.isCompleted = false
		
		do {
			try container.viewContext.save()
			return true
		} catch let error {
			print(error.localizedDescription)
			return false
		}
	}
	
	func fetchItems() -> [ToDoItem] {
		let fetchRequest = ToDoItem.fetchRequest()
		
		do {
			let list = try container.viewContext.fetch(fetchRequest)
			return list
		} catch {
			
			//Printing the error
			print(error.localizedDescription)
			
			return [ToDoItem]()
		}
	}
	
	func deleteItem(item: ToDoItem) {
		container.viewContext.delete(item)
		try? container.viewContext.save()
	}
	
	func updateItem(item: ToDoItem) {
		item.id = item.id
		item.title = item.title
		item.isCompleted = !item.isCompleted
		try? container.viewContext.save()
	}
}
