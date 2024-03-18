//
//  DetailsJobsViewModel.swift
//  Deeplink
//
//  Created by Nikola Ilic on 18.3.24..
//

import Foundation
import Alamofire

protocol DetailsJobsViewModelDelegate: AnyObject {
    func detailJobListViewModelDidFetchJobs(_ job: JobPosition)
}

class DetailsJobsViewModel {
    
    weak var delegate: DetailsJobsViewModelDelegate?
    
    func fetchJobs() {
        let url = "https://ca9f11d677aa476d83eb06457b695f9d.api.mockbin.io/"
        
        AF.request(url).responseDecodable(of: JobPosition.self) { response in
            switch response.result {
            case .success(let jobPositionsResponse):
                self.delegate?.detailJobListViewModelDidFetchJobs(jobPositionsResponse)
            case .failure(let error):
                print("Network request failed: \(error)")
            }
        }
    }
}

