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
    
    func fetchItems(input : String) -> Void {
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
                    case.success(let highlitedObjects) :
                        self.fetchItems(highlitedObjects) { items in
                            // finally get a filtered list of items
                            debugPrint(items)
                        }
                    case .failure(let error2) :
                        debugPrint(error2)
                    }
                }
                break
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    private func fetchCategory(search : String, callback : @escaping (Result<SearchDomainResponse, AFError>) -> Void) -> Void {
        
        
        self.apiCaller.execute(to: "\(Path.Sites.domainDiscovery)\(search)", method: .get, parameters: nil, encoding: JSONEncoding.default , callback: callback)
    }
    
    private func fetchHighlighteds(category : String, callback : @escaping (Result<HighlightedItemsDTO, AFError>) -> Void) -> Void{
        self.apiCaller.execute(to: "\(Path.Highlights.byCategory)/\(category)", method: .get, parameters: nil, encoding: JSONEncoding.default, callback: callback)
    }
    
    private func fetchItems(_ items: HighlightedItemsDTO, callback : @escaping (Result<HighlightedItemsDTO, AFError>) -> Void) {
        //curl -X GET -H 'Authorization: Bearer $ACCESS_TOKEN' https://api.mercadolibre.com/items?ids=$ITEM_ID1,$ITEM_ID2&attributes=$ATTRIBUTE1,$ATTRIBUTE2,$ATTRIBUTE3

    }
    
}
