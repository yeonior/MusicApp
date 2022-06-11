//
//  AuthManager.swift
//  MusicApp
//
//  Created by Ruslan on 08.06.2022.
//

import Foundation

final class AuthManager {
    
    struct Constants {
        static let clientID = ""
        static let clientSecret = ""
    }
    
    // MARK: - Properties
    static let shared = AuthManager()
    
    public var signInURL: URL? {
        let scope = "user-read-private"
        let redirectURI = ""
        let baseURL = "https://accounts.spotify.com/authorize"
        let string = "\(baseURL)?response_type=code&client_id=\(Constants.clientID)&scope\(scope)=foo&redirect_uri=\(redirectURI)"
        return URL(string: string)
    }
    
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
