//
//  Note.swift
//  Notes Watch App
//
//  Created by Oleksii Vasyliev on 23.04.2023.
//

import Foundation

/// A model describing single note.
struct Note: Identifiable, Codable {
	/// ID of the note
	let id: UUID
	/// Note's text.
	let text: String
}
