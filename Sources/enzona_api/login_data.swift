//
//  login_data.swift
//  enzona_ui
//
//  Created by Asiel Cabrera on 8/9/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation

struct Login: Encodable {
    let grant_type: String
    let scope:String
}
