//
//  NoItemView.swift
//  ToDoList
//
//  Created by Adil Mir on 25/01/23.
//

import SwiftUI

struct NoItemView: View {
	@State var isAnimating = false
    var body: some View {
		ScrollView {
			VStack(spacing:20) {
				Image(systemName: "checklist.unchecked")
					.resizable()
					.foregroundColor(.yellow)
					.scaledToFit()
					.frame(height: 100)
				Text("There are no items yet!")
					.font(.title)
					.fontWeight(.semibold)
				Text("You can click the add button to add a bunch of items to your to do list.")
				
				NavigationLink {
					AddView()
				} label: {
					Text("Add Items")
						.foregroundColor(.white)
						.frame(height: 55)
						.frame(maxWidth: .infinity)
						.background(isAnimating ? .red: .yellow)
						.cornerRadius(10)
				}
				.padding(.horizontal,isAnimating ? 40 : 80)
				.offset(y:isAnimating ? -7 : 0)
				.shadow(color: isAnimating ? .red.opacity(0.4) : .yellow.opacity(0.4)
						,radius: isAnimating ? 4 : 10,
						x: 0,
						y:isAnimating ? 20 : 20
				)


			}
			.padding(.top,30)
			.multilineTextAlignment(.center)
			.frame(maxWidth: 400)
			
		}
		.padding()
		.frame(maxWidth: .infinity,maxHeight: .infinity)
		.onAppear(perform: addAnimation)
		
    }
	
	func addAnimation() {
		guard !isAnimating else{return}
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			withAnimation(Animation.easeOut(duration: 1.5).repeatForever(autoreverses: true)) {
				isAnimating.toggle()
			}
		}
	}
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			NoItemView()
				.navigationTitle("Title")
		}
    }
}
