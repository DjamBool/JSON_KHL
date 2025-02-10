//
//  TeamModel.swift
//  JSON_KHL
//
//  Created by Игорь Мунгалов on 13.10.2022.
//

import Foundation

struct TeamModel: Decodable {
    let name: String?
    let location: String?
    let conference: String?
    let image: String?
}

struct Team: Decodable {
    let team: TeamModel
}
