//
//  People.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation

struct People: Codable {

  var createdAt      : String? = nil
  var firstName      : String? = nil
  var avatar         : String? = nil
  var lastName       : String? = nil
  var email          : String? = nil
  var jobtitle       : String? = nil
  var favouriteColor : String? = nil
  var id             : String? = nil

  enum CodingKeys: String, CodingKey {

    case createdAt      = "createdAt"
    case firstName      = "firstName"
    case avatar         = "avatar"
    case lastName       = "lastName"
    case email          = "email"
    case jobtitle       = "jobtitle"
    case favouriteColor = "favouriteColor"
    case id             = "id"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    createdAt      = try values.decodeIfPresent(String.self , forKey: .createdAt      )
    firstName      = try values.decodeIfPresent(String.self , forKey: .firstName      )
    avatar         = try values.decodeIfPresent(String.self , forKey: .avatar         )
    lastName       = try values.decodeIfPresent(String.self , forKey: .lastName       )
    email          = try values.decodeIfPresent(String.self , forKey: .email          )
    jobtitle       = try values.decodeIfPresent(String.self , forKey: .jobtitle       )
    favouriteColor = try values.decodeIfPresent(String.self , forKey: .favouriteColor )
    id             = try values.decodeIfPresent(String.self , forKey: .id             )
 
  }

  init() {

  }

}
