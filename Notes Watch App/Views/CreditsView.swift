//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Oleksii Vasyliev on 23.04.2023.
//

import SwiftUI

struct CreditsView: View {
	// MARK: - Body.
    var body: some View {
		VStack(spacing: 3) {
			Image("developer")
				.resizable()
				.scaledToFit()
				.layoutPriority(1)
			
			HeaderView(imageName: "person", title: "Credits")
			
			Text("Oleksii Vasyliev")
				.foregroundColor(.primary)
				.fontWeight(.bold)
			
			Text("Developer")
				.font(.footnote)
				.foregroundColor(.secondary)
				.fontWeight(.light)
		}
    }
}

struct CreaditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
