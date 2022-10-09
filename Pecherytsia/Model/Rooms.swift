//
//  Rooms.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation

struct Rooms: Codable {

  var createdAt    : String? = nil
  var isOccupied   : Bool?   = nil
  var maxOccupancy : Int?    = nil
  var id           : String? = nil

  enum CodingKeys: String, CodingKey {

    case createdAt    = "createdAt"
    case isOccupied   = "isOccupied"
    case maxOccupancy = "maxOccupancy"
    case id           = "id"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    createdAt    = try values.decodeIfPresent(String.self , forKey: .createdAt    )
    isOccupied   = try values.decodeIfPresent(Bool.self   , forKey: .isOccupied   )
    maxOccupancy = try values.decodeIfPresent(Int.self    , forKey: .maxOccupancy )
    id           = try values.decodeIfPresent(String.self , forKey: .id           )
 
  }

  init() {

  }

}
