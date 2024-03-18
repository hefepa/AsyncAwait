//
//  NetworkCall.swift
//  AsyncAwaitProject
//
//  Created by WEMA on 17/01/2024.
//

import Foundation

struct NetworkCall{
    let session = URLSession.shared
    
    
    func fetch(url: URL) async throws -> PhoneModel? {
        do {
            let (data, _) = try await session.data(from: url)
            let jsonDecoder = JSONDecoder()
            let phoneModel = try jsonDecoder.decode(PhoneModel.self, from: data)
            return phoneModel
        }catch{
            throw error
        }
    }
}
