//
//  Service.swift
//  challenge-job-readiness
//
//  Created by Camila Evelyn Blanc Fick on 17/09/2022.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func execute<T: Codable>(to path: String, method: RestMethod, parameters: [String:Any]?, encoding: ParameterEncoding, callback: @escaping (Result<T, AFError>) -> Void) -> Void
}

class NetworkService: NetworkServiceProtocol {
    
    private let appId = ProcessInfo.processInfo.environment["APP_ID"]
    private var accessToken: String?
    private var TGCode: String = ""
    
    public static let shared: NetworkServiceProtocol = {
        var service = NetworkService()
        return service
    }()
    
    func execute<T: Codable>(
        to path: String,
        method: RestMethod = .get,
        parameters: [String:Any]? = nil,
        encoding: ParameterEncoding = JSONEncoding.default,
        callback: @escaping (Result<T, AFError>) -> Void) -> Void {
            
            if self.accessToken == nil {
                self.renewAccessToken()
            }
            
            let url = Path.BASE_URL + path
            debugPrint("access tokennn:____\(self.accessToken ?? "")")
            let headers = HTTPHeaders(["Authentication" : "Bearer \(self.accessToken ?? "")"])
            
            let request =  AF.request(url, method: method.httpMethod, parameters: parameters, encoding: encoding, headers: headers)
            
//            AF.request("https://opentdb.com/api_category.php")
//            request.responseJSON { (data) in
//                do {
//                    let categories = try
//            JSONDecoder().decode(Categories.self, from: data.data!)
//                    print(categories.trivia_categories)
//                } catch {
//                    print(error)
//            } }
            
            /**
             case .success(let data):
                   do {
                       let postBody = try JSONDecoder().decode(PostBody.self, from: data)
                       print(postBody.responsePayload.statusData.statusCode)
                       print(postBody.responsePayload.statusData.documents.map { $0.docname })
                    } catch {
                        print(error)
                    }
             */
            
            request.responseJSON { (data) in
                
                    print("response!!!!!: _____")
                print(data)
            }
            
            request.response { response in
                print("response: _____")
                print(response)
                let statusCode = response.response?.statusCode
                print("status code: ______")
                print(statusCode) // the status code
                switch response.result {
                case .success(let data):
                    print("dataa: _____")
                    print(data)
                    do {
                        if let codedData = data {
                            let result = try JSONDecoder().decode(T.self, from: codedData)
                            
                            callback(.success(result))
                        }
                    } catch {
                        print("entro aca")
                        callback(.failure(AFError.parameterEncodingFailed(reason: AFError.ParameterEncodingFailureReason.customEncodingFailed(error: error) )))
                    }
                case .failure(let error):
                    print("error: _____")
                    print(error)

                    callback(.failure(error))
                }
            }
            
        }
    
    /**
     Renew API credentials when error is:
     failure(Alamofire.AFError.urlRequestValidationFailed(reason: Alamofire.AFError.URLRequestValidationFailureReason.bodyDataInGETRequest(24 bytes)))
     */
    func renewAccessToken() -> Void {
        let token = "" // insert token
        self.accessToken = token
        //        let url = "https://auth.mercadolibre.com.ar/authorization?response_type=code&client_id=\(self.appId)&redirect_uri=https://alkemy.org/"
        //         AF.request(url, method: .get).responseJSON { response in
        //                debugPrint("redirect = \(response.response?.url)")
        //            }
        //
        
    }
}
