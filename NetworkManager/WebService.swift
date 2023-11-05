//
//  WebService.swift
//  AppetizersApp
//
//  Created by Khairul on 10/28/23.
//


import UIKit

typealias JSONdictionary = [String:Any]

enum Result<A>
{
    case success(A)
    case failure(Error)
}

extension Result {
    public init(_ value: A?, or error: Error) {
        if let value = value {
            self = .success(value)
        } else {
            self = .failure(error)
        }
    }
    
    public var value: A? {
        guard case .success(let v) = self else { return nil }
        return v
    }
}

extension URLRequest
{
    init<A>(resource:Resource<A>)
    {
        self.init(url: resource.url)
        httpMethod = resource.method.method
        if case let .post(data) = resource.method
        {
            httpBody = data
        }
    }
}

final class WebService {
    
    static let shared = WebService()
    
    func load<A>(resource:Resource<A>,completion:@escaping (Result<A?>) -> ())
    {
        let request = URLRequest(resource: resource)
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error
            {
                completion(.failure(error))
            }
            else
            {
                if let data = data
                {
                    let result = resource.parse(data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                }
            }
        }.resume()
    }
}
