//
//  Payment_Response.swift
//  
//
//  Created by Asiel Cabrera on 8/4/20.
//

import Foundation

struct Payment_Response: Codable {
    var transaction_uuid: String
    var currency: Type_Currency
    var created_at: String
    var updated_at: String
    var status_code: Double
    var status_denom: String
    var description: String
    var invoice_number: Double
    var merchant_op_id: String
    var terminal_id: String
    var amount: Amount
    var items: [Items]
    var links: [Link]
    var commission: String
    
}


struct Link: Codable {
    var rel: String
    var method: String
    var href: String
    
}
