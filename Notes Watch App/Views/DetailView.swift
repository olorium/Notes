//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Oleksii Vasyliev on 23.04.2023.
//

import SwiftUI

struct DetailView: View {
	// MARK: - Properties
	/// Used to present credits view.
	@State private var isCreditsPresented: Bool = false
	/// Note for this view.
	let note: Note
	/// Total number of notes.
	let count: Int
	/// Index of the note from array.
	let index: Int
	
	// MARK: - Body
    var body: some View {
		VStack(alignment: .center, spacing: 3) {
			HeaderView(imageName: "note.text")
			
			Spacer()
			
			ScrollView(.vertical) {
				Text(note.text)
					.font(.title3)
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)
			}
			
			Spacer()
			
			HStack(alignment: .center) {
				Image(systemName: "gear")
					.imageScale(.large)
				Spacer()
				Text("\(count) / \(index + 1)")
				Spacer()
				Image(systemName: "info.circle")
					.imageScale(.large)
					.onTapGesture {
						isCreditsPresented.toggle()
					}
					.sheet(isPresented: $isCreditsPresented) { CreditsView() }
			}
			.foregroundColor(.secondary)
		}
		.padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
	static var sampleNote = Note(id: UUID(), text: "Hello")
    static var previews: some View {
		DetailView(note: sampleNote, count: 5, index: 1)
    }
}
