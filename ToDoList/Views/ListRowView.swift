//
//  ListRowView.swift
//  ToDoList
//
//  Created by Adil Mir on 24/01/23.
//

import SwiftUI

struct ListRowView: View {
	@ObservedObject var listItem: ToDoItem
	
	var body: some View {
		HStack {
			Image(systemName: listItem.isCompleted ? "checkmark.circle" : "circle")
				.foregroundColor(listItem.isCompleted ? .green : .red)
			Text(listItem.title ?? "Unknown")
			Spacer()
		}
		.font(.title2)
		.padding(.vertical,8)
	}
}

struct ListRowView_Previews: PreviewProvider {
	static let context = DataController().container.viewContext
	static var item1 = ToDoItem(context: context)

    static var previews: some View {
		ListRowView(listItem: item1)
		.previewLayout(.sizeThatFits)
	
    }
}
