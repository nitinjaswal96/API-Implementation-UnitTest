//
//  APIServiceBackend.swift
//  Api-UnitTest-Sample
//
//  Created by Nitin Jaswal on 2023-03-22.
//

import Foundation

struct APIServiceBackend: APIService {
    func send<T: Decodable>(
        request: APIRequest,
        completionHandler: @escaping (_: T?, _ error: APIError?) -> Void
    ) {
        guard let urlRequest = generateURLRequest(request: request) else {
            return completionHandler(nil, APIError.invalidURL)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, serverResponse, error in
            debugPrint(serverResponse ?? "")
            if let error = error {
                completionHandler(nil, APIError.failedRequest(description: error.localizedDescription))
            } else if let data = data {
                do {
                    let data = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(data, nil)
                } catch {
                    completionHandler(nil, APIError.failedRequest(description: error.localizedDescription))
                }
            } 
        }.resume()
    }
    
    func sendRequest<T: Decodable>(
        request: APIRequest,
        completionHandler: @escaping (_:[T]?, _ error: APIError?) -> Void
    ) {
        guard let urlRequest = generateURLRequest(request: request) else { return }
        
        URLSession.shared.dataTask(with: urlRequest) { data, serverResponse, error in
            debugPrint(serverResponse ?? "")
            if let error = error {
                completionHandler(nil, APIError.failedRequest(description: error.localizedDescription))
            } else if let data = data {
                do {
                    let response = try JSONDecoder().decode([T].self, from: data)
                    debugPrint(response)
                    completionHandler(response, nil)
                } catch(let error) {
                    completionHandler(nil, APIError.failedRequest(description: error.localizedDescription))
                }
            }
        }.resume()
    }

    func sendLocalRequest<T: Decodable>(
        request: APIRequest,
        completionHandler: @escaping (_: T?, _ error: APIError?) -> Void
    ) {
        if let url = Bundle.main.url(forResource: request.path, withExtension: request.fileExtension?.stringValue) {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                completionHandler(jsonData, nil)
            } catch(let error) {
                completionHandler(nil, APIError.failedRequest(description: error.localizedDescription))
            }
        } else {
            completionHandler(nil, APIError.invalidFile)
        }
    }
}

extension APIServiceBackend {
    private func generateURLRequest(request: APIRequest) -> URLRequest? {
        guard let url = URL(string: APIConstant.shared.baseURL + request.path) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.stringValue
        
        if let body = request.body {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
                debugPrint(String(data: urlRequest.httpBody!, encoding: .utf8) ?? "")
            } catch {
                debugPrint("Encoding request body failed")
                return nil
            }
        }
        
        // confirm header with backend-team
        if let headers = request.headers {
            urlRequest.allHTTPHeaderFields = headers
//            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        return urlRequest
    }
}
