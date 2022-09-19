//
//  Constants.swift
//  challenge-job-readiness
//
//  Created by Camila Evelyn Blanc Fick on 17/09/2022.
//

import Foundation
import Alamofire

enum RestMethod {
    case get
    case post(Decodable)
    
    var httpMethod: HTTPMethod {
        switch self {
        case .get:
            return HTTPMethod.get
        case .post:
            return HTTPMethod.post
        }
    }
}

enum Path {
    
    public static let BASE_URL = "https://api.mercadolibre.com/"
    public static let OAUTH = "oauth/token"
    enum SearchDomain {
        public static let domainDiscovery = "sites/MLA/domain_discovery/search?limit=1&q="
    }
    enum SearchCategory {
        public static let searchMovie = "highlights/MLA/category/"
        public static let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    }
}

//enum Keys {
//    public static let ACCESS_TOKEN = "APP_USR-3781042954231359-091712-d61d7e971db3df313dcaf87dea4a9bbc-187457586"
//
//}
