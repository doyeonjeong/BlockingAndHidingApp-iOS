//
//  BlockManager.swift
//  AppChadangi
//
//  Created by DOYEON JEONG on 2023/07/27.
//

import Foundation
import FamilyControls
import ManagedSettings
import DeviceActivity
import Combine

extension DeviceActivityName {
    static let daily = Self("daily")
}

final class BlockManager: ObservableObject {
    
    var selectedAppTokens: Set<ApplicationToken> {
        return newSelection.applicationTokens
    }
    
    let store = ManagedSettingsStore()
    
    @Published var isEmpty: Bool = true
    @Published var isBlocked: Bool = false
    @Published var newSelection: FamilyActivitySelection = .init() {
        didSet {
            isEmpty = selectedAppTokens.isEmpty
        }
    }

    func block(completion: @escaping (Result<Void, Error>) -> Void) {
        let deviceActivityCenter = DeviceActivityCenter()
        
        let blockSchedule = DeviceActivitySchedule(
            intervalStart: DateComponents(hour: 0, minute: 0),
            intervalEnd: DateComponents(hour: 23, minute: 59),
            repeats: true
        )

        store.shield.applications = selectedAppTokens
        do {
            try deviceActivityCenter.startMonitoring(DeviceActivityName.daily, during: blockSchedule)
        } catch {
            completion(.failure(error))
            return
        }
        isBlocked = true
        completion(.success(()))
    }
    
    func release() {
        isBlocked = false
        store.shield.applications = []
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
