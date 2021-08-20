// SettingsItemViewModel.swift, created on 26/07/21 by jair


import Foundation

extension SettingsViewModel {
    struct SettingsItemViewModel {
        let title: String
        let iconName: String
        let type: SettingsItemType
    }
    
    enum SettingsItemType {
        case account
        case mode
        case privacy
        case logout
    }
}
