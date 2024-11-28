//
//  DefaultsService.swift
//
//

import Foundation

final class DefaultsService {
    static let shared = DefaultsService()
    private let standard = UserDefaults.standard
    private init() {}
}

extension DefaultsService {
    var flow: RootContentView.ViewState {
        get {
            let name = standard.string(forKey: Keys.flow.rawValue) ?? ""
            return RootContentView.ViewState(rawValue: name) ?? .onboarding
        }
        set {
            standard.set(newValue.rawValue, forKey: Keys.flow.rawValue)
        }
    }
    
    var projects: [ProjectModel] {
        get {
            guard let data = standard.object(forKey: Keys.projects.rawValue) as? Data else {
                return []
            }
            let projects = try? JSONDecoder().decode([ProjectModel].self, from: data)
            return projects ?? []
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                standard.setValue(data, forKey: Keys.projects.rawValue)
            }
        }
    }
    
    var comments: [CommentModel] {
        get {
            guard let data = standard.object(forKey: Keys.comments.rawValue) as? Data else {
                return []
            }
            let comments = try? JSONDecoder().decode([CommentModel].self, from: data)
            return comments ?? []
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                standard.setValue(data, forKey: Keys.comments.rawValue)
            }
        }
    }
}

extension DefaultsService {
    func removeAll() {
        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            standard.removePersistentDomain(forName: bundleIdentifier)
        }
    }
}

// MARK: - Keys
extension DefaultsService {
    enum Keys: String {
        case flow
        case projects
        case comments
    }
}
