//
//  APIClient.swift
//  GenieKeyboard
//
//  Created by MAC on 27/03/23.
//

import Foundation
enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
}

struct HTTPHeader {
    let field: String
    let value: String
}

class APIRequest {
    let method: HTTPMethod
    let path: String
    var queryItems: [URLQueryItem]?
    var headers: [HTTPHeader]?
    var body: Data?
    var type : FeatureType?
    var baseURL : URL?
    init(baseURL : URL?, method: HTTPMethod, path: String,type : FeatureType?, params:Data?) {
        self.method = method
        self.path = path
        self.body = params
        self.type = type
        self.baseURL = baseURL
    }

    init<Body: Encodable>(method: HTTPMethod, path: String, body: Body) throws {
        self.method = method
        self.path = path
        self.body = try JSONEncoder().encode(body)
    }
}

struct APIResponse<Body> {
    let statusCode: Int
    let body: Body
}

extension APIResponse where Body == Data? {
    func decode<BodyType: Decodable>(to type: BodyType.Type) throws -> APIResponse<BodyType> {
        guard let data = body else {
            throw APIError.decodingFailure
        }
        let decodedJSON = try JSONDecoder().decode(BodyType.self, from: data)
        return APIResponse<BodyType>(statusCode: self.statusCode,
                                     body: decodedJSON)
    }
}

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailure
}

enum APIResult<Body> {
    case success(APIResponse<Body>)
    case failure(APIError)
}

struct APIClient {

    typealias APIClientCompletion = (APIResult<Data?>) -> Void

    private let session = URLSession.shared
    static var baseURL = URL(string: APIUrl.Base_URL.baseUrl)!

    func perform(_ request: APIRequest, _ completion: @escaping APIClientCompletion) {

        
        var urlComponents = URLComponents()
        urlComponents.scheme = request.baseURL?.scheme
        urlComponents.host = request.baseURL?.host
        urlComponents.path = request.baseURL?.path ?? ""
        urlComponents.queryItems = request.queryItems


        guard let url = urlComponents.url?.appendingPathComponent(request.path) else {
            completion(.failure(.invalidURL)); return
        }
        

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if request.type == .suggestion {
            urlRequest.setValue(APIUrl.HeaderConfig.rapidAPIKey, forHTTPHeaderField: "X-RapidAPI-Key")
            urlRequest.setValue(APIUrl.HeaderConfig.rapidAPIHost, forHTTPHeaderField:"X-RapidAPI-Host")
        } else {
            urlRequest.setValue(APIUrl.HeaderConfig.openAIAPIAuthToken, forHTTPHeaderField: "Authorization")
        }
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            print("RESPONSE",response as Any)
            print("DATA",data as Any)
            print("ERROR",error as Any)
            do {
                if let data = data{
                    let json = try JSONSerialization.jsonObject(with:data , options: []) as? [String : Any]
                    print("JSON",json as Any)
                }
              
            } catch {
                print("errorMsg")
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed)); return
            }
            completion(.success(APIResponse<Data?>(statusCode: httpResponse.statusCode, body: data)))
        }
        task.resume()
    }
}



