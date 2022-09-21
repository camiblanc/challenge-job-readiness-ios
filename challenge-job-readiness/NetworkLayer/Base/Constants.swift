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
    enum BASE {
        public static let URL = "https://api.mercadolibre.com/"
        public static let AUTH_URL = "https://auth.mercadolibre.com.ar/authorization"
        public static let OAUTH = "oauth/token"
        public static let REDIRECT_URI = "https://alkemy.com"
    }
    
    enum Sites {
        public static let domainDiscovery = "sites/MLA/domain_discovery/search?limit=1&q="
    }
    enum Highlights {
        public static let byCategory = "highlights/MLA/category"
    }

    public static let items = "items"

}

//enum Keys {
//    public static let ACCESS_TOKEN = "APP_USR-3781042954231359-091712-d61d7e971db3df313dcaf87dea4a9bbc-187457586"
//
//}
