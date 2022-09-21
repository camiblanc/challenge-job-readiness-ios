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
// TODO: just query necessary atributtes  like: https://api.mercadolibre.com/items?ids=$ITEM_ID1,$ITEM_ID2&attributes=$ATTRIBUTE1,$ATTRIBUTE2,$ATTRIBUTE3

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
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
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
    let body: ISBody
}

typealias ItemsSearchResponse = [ItemsSearchDTO]

// MARK: - Body
struct ISBody: Codable {
    let id, siteID, title: String
    let subtitle: String? //JSONNull
    let sellerID: Int
    let categoryID: String
    let officialStoreID: Int?
    let price, basePrice: Double
    let originalPrice: Int
    let currencyID: String
    let initialQuantity, availableQuantity, soldQuantity: Int
    let saleTerms: [Attribute]
    let buyingMode, listingTypeID, startTime, stopTime: String
    let condition: String
    let permalink: String
    let thumbnailID: String
    let thumbnail: String
    let secureThumbnail: String
    let pictures: [Picture]
    let videoID: String?
    let descriptions: [String]
    let acceptsMercadopago: Bool
    let nonMercadoPagoPaymentMethods: [JSONAny]
    let shipping: Shipping
    let internationalDeliveryMode: String
    let sellerAddress: SellerAddress
    let sellerContact: String? //JSONNull
    let location: Location
    let coverageAreas: [JSONAny]
    let attributes: [Attribute]
    let warnings: [JSONAny]
    let listingSource: String
    let variations: [Variation]
    let status: String
    let subStatus: [JSONAny]
    let tags: [String]
    let warranty: String
    let catalogProductID: String? //JSONNull
    let domainID: String
    let parentItemID, differentialPricing: String? //JSONNull
    let dealIDS: [String]
    let automaticRelist: Bool
    let dateCreated, lastUpdated: String
    let health: Double
    let catalogListing: Bool
    let channels: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title, subtitle
        case sellerID = "seller_id"
        case categoryID = "category_id"
        case officialStoreID = "official_store_id"
        case price
        case basePrice = "base_price"
        case originalPrice = "original_price"
        case currencyID = "currency_id"
        case initialQuantity = "initial_quantity"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case saleTerms = "sale_terms"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case startTime = "start_time"
        case stopTime = "stop_time"
        case condition, permalink
        case thumbnailID = "thumbnail_id"
        case thumbnail
        case secureThumbnail = "secure_thumbnail"
        case pictures
        case videoID = "video_id"
        case descriptions
        case acceptsMercadopago = "accepts_mercadopago"
        case nonMercadoPagoPaymentMethods = "non_mercado_pago_payment_methods"
        case shipping
        case internationalDeliveryMode = "international_delivery_mode"
        case sellerAddress = "seller_address"
        case sellerContact = "seller_contact"
        case location
        case coverageAreas = "coverage_areas"
        case attributes, warnings
        case listingSource = "listing_source"
        case variations, status
        case subStatus = "sub_status"
        case tags, warranty
        case catalogProductID = "catalog_product_id"
        case domainID = "domain_id"
        case parentItemID = "parent_item_id"
        case differentialPricing = "differential_pricing"
        case dealIDS = "deal_ids"
        case automaticRelist = "automatic_relist"
        case dateCreated = "date_created"
        case lastUpdated = "last_updated"
        case health
        case catalogListing = "catalog_listing"
        case channels
    }
}

// MARK: - Attribute
struct Attribute: Codable {
    let id, name: String
    let valueID: String?
    let valueName: String
    let valueStruct: ValueStruct?
    let values: [Value]
    let attributeGroupID: AttributeGroupID?
    let attributeGroupName: AttributeGroupName?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
        case values
        case attributeGroupID = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
    }
}

enum AttributeGroupID: String, Codable {
    case others = "OTHERS"
}

enum AttributeGroupName: String, Codable {
    case otros = "Otros"
}

// MARK: - Struct
struct ValueStruct: Codable {
    let number: Double
    let unit: Unit
}

enum Unit: String, Codable {
    case días = "días"
    case h = "h"
    case l = "L"
    case meses = "meses"
}

// MARK: - Value
struct Value: Codable {
    let id: String?
    let name: String
    let valueStruct: ValueStruct?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueStruct = "struct"
    }
}

// MARK: - Location
struct Location: Codable {
}

// MARK: - Picture
struct Picture: Codable {
    let id: String
    let url: String
    let secureURL: String
    let size, maxSize, quality: String

    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
}

// MARK: - SellerAddress
struct SellerAddress: Codable {
    let city, state, country: City
    let searchLocation: SearchLocation
    let id: Int

    enum CodingKeys: String, CodingKey {
        case city, state, country
        case searchLocation = "search_location"
        case id
    }
}

// MARK: - City
struct City: Codable {
    let id: String?
    let name: String
}

// MARK: - SearchLocation
struct SearchLocation: Codable {
    let neighborhood: City?
    let city, state: City
}

// MARK: - Shipping
struct Shipping: Codable {
    let mode: String
    let methods: [JSONAny]
    let tags: [String]
    let dimensions: String? //JSONNull
    let localPickUp, freeShipping: Bool
    let logisticType: String
    let storePickUp: Bool

    enum CodingKeys: String, CodingKey {
        case mode, methods, tags, dimensions
        case localPickUp = "local_pick_up"
        case freeShipping = "free_shipping"
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}

// MARK: - Variation
struct Variation: Codable {
    let id: Int
    let price: Double
    let attributeCombinations: [AttributeCombination]
    let availableQuantity, soldQuantity: Int
    let saleTerms: [JSONAny]
    let pictureIDS: [String]
    let catalogProductID: String? //JSONNull

    enum CodingKeys: String, CodingKey {
        case id, price
        case attributeCombinations = "attribute_combinations"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case saleTerms = "sale_terms"
        case pictureIDS = "picture_ids"
        case catalogProductID = "catalog_product_id"
    }
}

// MARK: - AttributeCombination
struct AttributeCombination: Codable {
    let id: ID
    let name: Name
    let valueID: String?
    let valueName: String
    let valueStruct: String? //JSONNull
    let values: [Value]

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
        case values
    }
}

enum ID: String, Codable {
    case color = "COLOR"
}

enum Name: String, Codable {
    case color = "Color"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

