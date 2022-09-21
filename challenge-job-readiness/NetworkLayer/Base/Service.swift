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
    private var TGCode: String?
    
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
            // TODO: add do catch to throw error if could not get access token
            if self.accessToken == nil {
                self.getAccessToken()
            }
            
            let url = Path.BASE.URL + path
            
            let headers = HTTPHeaders(["Authorization" : "Bearer \(self.accessToken ?? "")"])
            
            print("headersssssss")
            print(headers)
            
            let request =  AF.request(url, method: method.httpMethod, parameters: parameters, encoding: encoding, headers: headers)
            
            /*
             */
            request.responseJSON { (data) in
//                print("response!!!!!: _____")
//                print(data)
                debugPrint("url!_________________")
                print(data.request?.url)
            }
             
            
            request.response { response in
                print("response: _____")
                print(response)
                let statusCode = response.response?.statusCode
                print("status code: ______")
                print(statusCode) // the status code
                
                switch response.result {
                case .success(let data):
//                    print("dataa: _____")
//                    print(data)
                    do {
                        if let codedData = data {
                            let result = try JSONDecoder().decode(T.self, from: codedData)
                            
                            callback(.success(result))
                        }
                    } catch {
                        // return error of type ParameterEncodingFailureReason
                        print("hubo error de encoding")
                        callback(.failure(AFError.parameterEncodingFailed(reason: AFError.ParameterEncodingFailureReason.customEncodingFailed(error: error) )))
                    }
                case .failure(let error):
                    print("error: _____")
                    print(error)
                    
                    // TODO: validate if error code  is 401 and retry
                    /* {
                        "message": "invalid_token",
                        "error": "not_found",
                        "status": 401,
                        "cause": []
                     }
                     */
                    // retryExe()

                    callback(.failure(error))
                }
            }
            
        }
    
    /**
     Renew API credentials when error is:
     failure(Alamofire.AFError.urlRequestValidationFailed(reason: Alamofire.AFError.URLRequestValidationFailureReason.bodyDataInGETRequest(24 bytes)))
     */
    func getAccessToken() -> Void {
        let token = "APP_USR-3781042954231359-092112-8407eedcef41e47fb96b1164f374f398-187457586" // insert token
        self.accessToken = token
        //        let url = "https://auth.mercadolibre.com.ar/authorization?response_type=code&client_id=\(self.appId)&redirect_uri=https://alkemy.org/"
        //         AF.request(url, method: .get).responseJSON { response in
        //                debugPrint("redirect = \(response.response?.url)")
        //            }
        //
        
    }
    
//    func retryExe<T: Codable>(
//            to path: String,
//            method: RestMethod = .get,
//            parameters: [String:Any]? = nil,
//            encoding: ParameterEncoding = JSONEncoding.default,
//            callback: @escaping (Result<T, AFError>) -> Void) -> Void {
//        //get new access token and call execute
//    }
}
