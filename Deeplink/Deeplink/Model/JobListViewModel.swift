//
//  JobListViewModel.swift
//  Deeplink
//
//  Created by Nikola Ilic on 18.3.24..
//

import Foundation
import Alamofire

protocol JobListViewModelDelegate: AnyObject {
    func jobListViewModelDidFetchJobs(_ job: JobPositionsResponse)
}

class JobListViewModel {
    
    weak var delegate: JobListViewModelDelegate?
    
    func fetchJobs() {
        let url = "https://ca9f11d677aa476d83eb06457b695f9d.api.mockbin.io/"
        
        AF.request(url).responseDecodable(of: JobPositionsResponse.self) { response in
            switch response.result {
            case .success(let jobPositionsResponse):
                self.delegate?.jobListViewModelDidFetchJobs(jobPositionsResponse)
            case .failure(let error):
                print("Network request failed: \(error)")
            }
        }
    }
}
