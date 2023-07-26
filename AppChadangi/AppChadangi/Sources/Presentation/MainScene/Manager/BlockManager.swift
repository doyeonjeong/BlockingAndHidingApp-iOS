//
//  BlockManager.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/27.
//

import Foundation
import FamilyControls
import ManagedSettings

final class BlockManager: ObservableObject {
    
    @Published var newSelection: FamilyActivitySelection = .init()
    
    var selectedAppTokens: Set<ApplicationToken> {
        return newSelection.applicationTokens
    }
    
    var selectedApps: Set<Application> {
        return newSelection.applications
    }
    
    func requestAuthorization() {
        Task {
            do {
                try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
