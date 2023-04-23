//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Oleksii Vasyliev on 23.04.2023.
//

import SwiftUI

struct HeaderView: View {
	// MARK: - Properties
	/// The name of the image
	let imageName: String
	/// The title for the header. Empty by default.
	var title: String = ""
	
	// MARK: - Body
    var body: some View {
		VStack {
			if !title.isEmpty {
				Text(title.uppercased())
					.font(.title3)
					.fontWeight(.bold)
					.foregroundColor(.accentColor)
			}
			
			HStack {
				Capsule()
					.frame(height: 1)
				Image(systemName: imageName)
				Capsule()
					.frame(height: 1)
			}
			.foregroundColor(.accentColor)
		}
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
		HeaderView(imageName: "note.text")
    }
}
