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
			
			if !notes.isEmpty {
				List {
					ForEach(notes) { note in
						HStack {
							Capsule()
								.frame(width: 4)
								.foregroundColor(.accentColor)
							Text(note.text)
								.lineLimit(1)
								.padding(.leading, 5)
						}
					}
					.onDelete(perform: delete)
				}
			} else {
				Spacer()
				Image(systemName: "note.text")
					.resizable()
					.scaledToFit()
					.foregroundColor(.gray)
					.opacity(0.25)
					.padding(25)
				Spacer()
			}
        }
        .navigationTitle("Notes")
		.onAppear {
			load()
		}
    }
	
	// MARK: - Methods.
	
	private func save() {
		do {
			let data = try JSONEncoder().encode(notes)
			let url = getDocumentDirectory().appendingPathComponent("notes")
			try data.write(to: url)
		} catch {
			print("Saving data has failed")
		}
	}
	
	private func load() {
		DispatchQueue.main.async {
			do {
				let url = getDocumentDirectory().appendingPathComponent("notes")
				let data = try Data(contentsOf: url)
				notes = try JSONDecoder().decode([Note].self, from: data)
			} catch {
				print("No data file founded")
			}
		}
	}
	
	private func delete(offsets: IndexSet) {
		withAnimation {
			notes.remove(atOffsets: offsets)
			save()
		}
	}
	
	private func getDocumentDirectory() -> URL {
		let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return path[0]
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
