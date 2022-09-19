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
    
    func fetchItems(input : String){
        // fetch a suitable category
        self.fetchCategory(search: input) { response in
            switch response {
            case .success(let sthg):
                //search top 20
                print("doneee____")
                print(sthg)
                //                let category = activity.first?.categoryID
                //                guard !category!.isEmpty else {
                //                    return
                //                }
                //                self.fetchTopProduct(search: category!) { result2 in
                //                    switch result2 {
                //                    case.success(let categorys) :
                //                        print(categorys.content.first)
                //                    case .failure(let error2) :
                //                        print(error2)
                //                    }
                //                }
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchCategory(search : String, callback : @escaping (Result<SearchDomainResponse, AFError>) -> Void) -> Void {
        
        
        self.apiCaller.execute(to: "\(Path.SearchDomain.domainDiscovery)\(search)", method: .get, parameters: nil, encoding: JSONEncoding.default , callback: callback)
    }
    
    //    private func fetchTopProduct(search : String, callback : @escaping (Result<Category, Error>) -> Void) -> Void{
    //        self._restClient.call(.get, "highlights/MLA/category/\(search)", callback: callback)
    //    }
    
}
