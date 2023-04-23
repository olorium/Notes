//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Oleksii Vasyliev on 23.04.2023.
//

import SwiftUI

struct SettingsView: View {
	// MARK: - Properties.
	/// Number of lines stored in UserDefaults.
	@AppStorage("lineCount") var lineCount: Int = 1
	/// Number of lines used in Slider.
	@State private var value: Float = 1.0
	
	// MARK: - Body.
    var body: some View {
		VStack(spacing: 8) {
			HeaderView(imageName: "gear", title: "Settings")
			Text("Lines: \(lineCount)".uppercased())
			Slider(value: Binding(get: {
				self.value
			}, set: { (newValue) in
				self.value = newValue
				self.lineCount = Int(newValue)
			}), in: 1...4, step: 1)
				.accentColor(.accentColor)
		}
		.onAppear() {
			value = Float(lineCount)
		}
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
