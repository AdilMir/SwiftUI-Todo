//
//  ListView.swift
//  ToDoList
//
//  Created by Adil Mir on 24/01/23.
//

import SwiftUI


struct ListView: View {
	
	@EnvironmentObject var listViewModel: ListViewModel
		
    var body: some View {
		ZStack {
			if listViewModel.listItems.count > 0 {
				List {
					
					ForEach(listViewModel.listItems) { listItem in
						ListRowView(listItem: listItem)
							.onTapGesture {
								withAnimation(Animation.linear) {
									listViewModel.updateItem(item: listItem)
								}
							}
					}
					.onDelete(perform: listViewModel.deleteitems)
					.onMove(perform: listViewModel.moveItem)
				}
				.listStyle(.plain)
			} else {
				NoItemView().transition(.opacity.animation(.easeIn))
			}
		}
		.navigationTitle("Todo List 📝")
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				EditButton()
			}
		
			ToolbarItem(placement: .navigationBarTrailing) {
				NavigationLink("Add") {
					AddView()
				}
			}
		}
		
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			ListView()
		}
		.environmentObject(ListViewModel())
    }
}


