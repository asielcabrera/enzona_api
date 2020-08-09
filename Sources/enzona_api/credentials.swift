//
//  credentials.swift
//  enzona_ui
//
//  Created by Asiel Cabrera on 8/8/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation

let credentials: Credentials = load("credentials.json")

func load<T:Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("No se pudo encontrar \(filename) en el main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch{
        fatalError("No se puede cargar \(filename) en el main bundle: \n \(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("No se pudo parsear \(filename) como \(T.self): \n \(error)")
    }
}

struct Credentials:  Codable, Hashable {
    var username: String
    var password: String
    var customer_key: String
    var customer_secret: String
}
