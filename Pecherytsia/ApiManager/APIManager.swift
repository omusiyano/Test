//
//  APIManager.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation
import UIKit

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

class APIManager: NSObject {
    class func getColour(name: String, completion: ((Result<UIColor>) -> Void)?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "www.color-name.com"
        urlComponents.path = "/\(name).color"

        guard let url = urlComponents.url else {
            print("__error: Could not create URL from components")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
 
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    let decodedString = (String(decoding: jsonData, as: UTF8.self))
                    let components = decodedString.components(separatedBy: "color hex code is #")
                    let hexColor = components[1].prefix(6)
                    if ((hexColor.count) != 6) {
                        completion?(.success(UIColor.gray))
                        }
                    var rgbValue:UInt64 = 0
                    Scanner(string: String(hexColor)).scanHexInt64(&rgbValue)
                    let color = UIColor(
                        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                        alpha: CGFloat(1.0)
                    )
                    completion?(.success(color))
                }
            }
        }
        task.resume()
    }
    class func getRooms(completion: ((Result<[Rooms]>) -> Void)?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "61e947967bc0550017bc61bf.mockapi.io"
        urlComponents.path = "/api/v1/rooms"

        guard let url = urlComponents.url else {
            print("__error: Could not create URL from components")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
 
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, error) in
            DispatchQueue.main.async {
                 if let jsonData = responseData {
                    let decoder = JSONDecoder()
                     do {
                        let rooms = try decoder.decode([Rooms].self, from: jsonData)
                        completion?(.success(rooms))
                    } catch {
                        completion?(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
    class func getPeople(completion: ((Result<[People]>) -> Void)?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "61e947967bc0550017bc61bf.mockapi.io"
        urlComponents.path = "/api/v1/people"

        guard let url = urlComponents.url else {
            print("__error: Could not create URL from components")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
 
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, error) in
            DispatchQueue.main.async {
                 if let jsonData = responseData {
                    let decoder = JSONDecoder()
                     do {
                        let peoples = try decoder.decode([People].self, from: jsonData)
                        completion?(.success(peoples))
                    } catch {
                        completion?(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}


