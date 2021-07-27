// SettingsViewModel.swift, created on 26/07/21 by jair
	

import Combine
import SwiftUI

final class SettingsViewModel: ObservableObject {
    @Published private(set) var itemViewModels: [SettingsItemViewModel] = []
    @AppStorage("isDarkMode") private var isDarkMode = false
    let title = "Settings"
    
    func item(at index: Int) -> SettingsItemViewModel {
        itemViewModels[index]
    }
    
    func tappedItem(at index: Int) {
        switch itemViewModels[index].type {
        case .mode:
            isDarkMode.toggle()
            buildItems()
        default: break
        }
    }
    
    private func buildItems() {
        itemViewModels = [
            .init(title: "Create account", iconName: "person.circle", type: .account),
            .init(title: "Switch to \(isDarkMode ? "Light" : "Dark") Mode",
                  iconName: "lightbulb", type: .mode),
            .init(title: "Privacy Policy", iconName: "shield", type: .privacy)
        ]
    }
    
    func onAppear() {
        buildItems()
    }
    
    
}
