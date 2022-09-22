//
//  SearchService.swift
//  challenge-job-readiness
//
//  Created by Camila Evelyn Blanc Fick on 18/09/2022.
//

import Foundation
import Alamofire

class SearchService {
    
    public static let shared = SearchService()
    
    private init(){}
    
    private var apiCaller = NetworkService.shared
    
    func fetchItems(input : String, callback: @escaping (ItemSearchResponse) -> Void) -> Void {
        // find a suitable category
        self.fetchCategory(search: input) { response in
            switch response {
            case .success(let data):
                //search highlighteds
                let category = data.first?.categoryID
                guard !category!.isEmpty else {
                    // TODO: throw ERROR NO CATEGORY FOUND 404
                    return
                }
                self.fetchHighlighteds(category: category!) { highlighteds in
                    switch highlighteds {
                    case .success(let highlitedObjects) :
                        self.fetchItems(highlitedObjects) { items in
                            // finally get a filtered list of items
                            switch items {
                            case .success(let resultItems):
                                callback(resultItems)
                                break
                        
                            case .failure(let error3):
                                debugPrint(error3)
                                callback([])
                                break
                            }
                        }
                        break
                    case .failure(let error2) :
                        debugPrint(error2)
                        callback([])
                        break
                    }
                }
                break
            case .failure(let error):
                debugPrint(error.localizedDescription)
                // TODO: trow error
                callback([])
            }
        }
    }
    
    private func fetchCategory(search : String, callback : @escaping (Result<SearchDomainResponse, AFError>) -> Void) -> Void {
        self.apiCaller.execute(to: "\(Path.Sites.domainDiscovery)\(search)", method: .get, parameters: nil, encoding: JSONEncoding.default , callback: callback)
    }
    
    private func fetchHighlighteds(category : String, callback : @escaping (Result<HighlightedItemsDTO, AFError>) -> Void) -> Void{
        self.apiCaller.execute(to: "\(Path.Highlights.byCategory)/\(category)", method: .get, parameters: nil, encoding: JSONEncoding.default, callback: callback)
    }
    
    private func fetchItems(_ items: HighlightedItemsDTO, callback : @escaping (Result<ItemSearchResponse, AFError>) -> Void) {
//        let testsIds = ["MLA907360785","MLA1127925558", "MLA904752661", "MLA820820504"].joined(separator:",")
        let attributes = ["id", "title", "secure_thumbnail", "price"].joined(separator:",")
//        let parameters : [String:Any]
        let filteredItemsIds = items.content.filter({$0.type != HITypeEnum.product }).map({$0.id}).joined(separator:",")
        let path = "\(Path.items)?ids=\(filteredItemsIds)&attributes=\(attributes)"
        
        self.apiCaller.execute(to: path , method: .get, parameters: nil, encoding: JSONEncoding.default, callback: callback)
    }
    
}
