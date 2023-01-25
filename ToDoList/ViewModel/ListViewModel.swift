//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Adil Mir on 24/01/23.
//

import Foundation

class ListViewModel: ObservableObject {
	
	private let dataController = DataController()
	@Published var listItems: [ToDoItem] = []
	
	init() {
		getItems()
	}
	
	func getItems() {
		listItems = dataController.fetchItems()
	}
	
	func deleteitems(indexSet: IndexSet) {
		indexSet.forEach { index in
			dataController.deleteItem(item: listItems[index])
		}
		
		listItems.remove(atOffsets: indexSet)
	}
	
	func moveItem(form:IndexSet, to: Int) {
		listItems.move(fromOffsets: form, toOffset: to)
	}
	
	func addItem(title:String) {
		if dataController.saveNewToDo(title: title) {
			getItems()
		}
	}
	
	func updateItem(item:ToDoItem) {
		dataController.updateItem(item: item)
		getItems()
	}
}
