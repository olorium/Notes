//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Oleksii Vasyliev on 23.04.2023.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Properties.
	/// Collection of all notes
	@State private var notes: [Note] = []
	/// Text for the note.
	@State private var text: String = ""
	
	// MARK: - Body.
    var body: some View {
        VStack {
			HStack(alignment: .center, spacing: 6) {
				TextField("Add New Note", text: $text)
				
				Button {
					guard !text.isEmpty else { return }
					let note = Note(id: UUID(), text: text)
					notes.append(note)
					text = ""
					save()
				} label: {
					Image(systemName: "plus.circle")
						.font(.system(size: 42, weight: .semibold))
				}
				.fixedSize()
				.buttonStyle(PlainButtonStyle())
				.foregroundColor(.accentColor)

			}
			Spacer()
			Text("\(notes.count)")
        }
        .navigationTitle("Notes")
    }
	
	// MARK: - Methods.
	
	private func save() {
		dump(notes)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
