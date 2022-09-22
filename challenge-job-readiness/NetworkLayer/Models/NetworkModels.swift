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

// MARK: - Search Highlighted Items IDs Response
// TODO: just query necessary atributtes https://api.mercadolibre.com/items?ids=$ITEM_ID1,$ITEM_ID2&attributes=$ATTRIBUTE1,$ATTRIBUTE2,$ATTRIBUTE3

struct HighlightedItemsDTO: Codable {
    let queryData: HIQueryData
    let content: [HIContent]
    
    enum CodingKeys: String, CodingKey {
        case queryData = "query_data"
        case content
    }
}

struct HIContent: Codable {
    let id: String
    let position: Int
    let type: HITypeEnum
}

enum HITypeEnum: String, Codable {
    case item = "ITEM"
    case product = "PRODUCT"
}

struct HIQueryData: Codable {
    let highlightType, criteria, id: String
    
    enum CodingKeys: String, CodingKey {
        case highlightType = "highlight_type"
        case criteria, id
    }
}

// MARK: - Search Highlited Items list
struct ItemsSearchDTO: Codable {
    let code: Int
    let body: ItemsSearchBody
    
    func fromDTO() -> Item {
        
        return Item(
            id: self.body.id,
            title: self.body.title,
            secure_thumbnail: self.body.secureThumbnail,
            price: self.body.price
        )
    }
}

// MARK: - Body
struct ItemsSearchBody: Codable {
    let id, title: String
    let price: Double
    let secureThumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, price
        case secureThumbnail = "secure_thumbnail"
    }
}

typealias ItemSearchResponse = [ItemsSearchDTO]


// MARK: - DetailDTO
struct DetailDTO: Codable {
    let text, plainText, lastUpdated, dateCreated: String
    let snapshot: ItemDetailSnapshot
    
    enum CodingKeys: String, CodingKey {
        case text
        case plainText = "plain_text"
        case lastUpdated = "last_updated"
        case dateCreated = "date_created"
        case snapshot
    }
    
    func fromDTO(id: String) -> ItemDetail {
        return ItemDetail(id: id , description: text)
    }
}

// MARK: - Snapshot
struct ItemDetailSnapshot: Codable {
    let url: String
    let width, height: Int
    let status: String
}
