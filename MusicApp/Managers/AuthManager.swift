//
//  AuthManager.swift
//  MusicApp
//
//  Created by Ruslan on 08.06.2022.
//

import Foundation

final class AuthManager {
    
    // MARK: - Properties
    static let shared = AuthManager()
    
    var isSignedIn: Bool {
        false
    }
    
    private var accessToken: String? {
        nil
    }
    
    private var refreshToken: String? {
        nil
    }
    
    private var tokenExpirationDate: Date? {
        nil
    }
    
    private var shouldRefreshToken: Bool {
        false
    }
    
    // MARK: - Init
    private init() {}
}
