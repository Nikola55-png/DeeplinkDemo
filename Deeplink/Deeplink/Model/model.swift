//
//  model.swift
//  Deeplink
//
//  Created by Nikola Ilic on 18.3.24..
//

import Foundation


struct JobPosition: Codable {
    let slika: String
    let naziv: String
    let plata: String
    let opisPozicije: String
    let opisFirme: String
    let tehnologije: [String] 
}


struct JobPositionsResponse: Codable {
    let pozicije: [JobPosition]
}
