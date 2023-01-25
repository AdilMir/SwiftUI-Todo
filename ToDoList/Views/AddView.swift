//
//  AddView.swift
//  ToDoList
//
//  Created by Adil Mir on 24/01/23.
//

import SwiftUI


struct AddView: View {
	@Environment(\.presentationMode) var presentationMode
	@State var textFieldText = ""
	@EnvironmentObject var listViewModel: ListViewModel
	
	//ALert
	@State var alertTitle = ""
	@State var showAlert = false
	
    var body: some View {
			ScrollView {
				VStack {
					TextField("Type here", text: $textFieldText)
						.padding(.horizontal)
						.frame(height: 55)
						.background(Color(uiColor: .secondarySystemBackground))
						.cornerRadius(10)
					
					Button {
						saveButtonPressed()
					} label: {
						Text("SAVE")
							.foregroundColor(.white)
							.font(.headline)
							.frame(height: 55)
							.frame(maxWidth: .infinity)
							.background(Color.yellow)
							.cornerRadius(10)
					}
				}
				.padding()
			}
			.navigationTitle("Add an Item🖊️")
			.alert(isPresented: $showAlert) {
				getAlert()
			}
    }
}

extension AddView {
	
	func saveButtonPressed() {
		guard textIsAppropiate() else{return}
		listViewModel.addItem(title:textFieldText)
		presentationMode.wrappedValue.dismiss()
	}
	
	func textIsAppropiate() -> Bool {
		if textFieldText.trimmingCharacters(in: .whitespacesAndNewlines).count < 3 {
			alertTitle = "Your new todo item must be at least three characters long! 😨😱"
			showAlert.toggle()
			return false
		}
		return true
	}
	
	func getAlert() -> Alert {
		return Alert(title: Text(alertTitle))
	}
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			AddView()
		}
		.environmentObject(ListViewModel())
    }
}
