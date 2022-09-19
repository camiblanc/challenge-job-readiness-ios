//
//  File.swift
//  challenge-job-readiness
//
//  Created by Camila Evelyn Blanc Fick on 18/09/2022.
//

import Foundation

// MARK: - OAuth Response
struct OAuth: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
    let scope: String
    let userID: Int
    let refreshToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case userID = "user_id"
        case refreshToken = "refresh_token"
        case scope
    }
}

// MARK: - Search Domain Response
struct SearchDomainDTO: Codable {
    let domainID, domainName, categoryID, categoryName: String
    let attributes: [SDAttribute]

    enum CodingKeys: String, CodingKey {
        case domainID = "domain_id"
        case domainName = "domain_name"
        case categoryID = "category_id"
        case categoryName = "category_name"
        case attributes
    }
}

struct SDAttribute: Codable {
    let id, name, valueID, valueName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
    }
}

typealias SearchDomainResponse = [SearchDomainDTO]

// MARK: - Search Category Items Response
struct SearchCategoryItemsDTO: Codable {
    let queryData: SCIQueryData
    let content: [SCIContent]

    enum CodingKeys: String, CodingKey {
        case queryData = "query_data"
        case content
    }
}

// MARK: - Content
struct SCIContent: Codable {
    let id: String
    let position: Int
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case item = "ITEM"
    case product = "PRODUCT"
}

struct SCIQueryData: Codable {
    let highlightType, criteria, id: String

    enum CodingKeys: String, CodingKey {
        case highlightType = "highlight_type"
        case criteria, id
    }
}
