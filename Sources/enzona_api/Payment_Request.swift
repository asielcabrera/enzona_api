//
//  Payment_Request.swift
//  
//
//  Created by Asiel Cabrera on 8/4/20.
//

import Foundation

// Payment struct Codable
struct Payment_Request: Codable {
    var description: String
    var currency: Type_Currency
    var amount: Amount
    var items: [Items]
    var merchant_op_id: Double
    var invoice_number: Double
    var return_url: String
    var cancel_url: String
    var terminal_id: Double
    var buyer_identity_code: String
}

enum Type_Currency: Codable {
    case CUP = "CUP"
    case CUC = "CUC"
    case USD = "USD"
}

struct Amount: Codable {
    var total: Double
    var details: Details
}
struct Details: Codable {
    var shipping: Double
    var tax: Double
    var discount: Double
    var tip: Double
}
struct Items: Codable {
    var name: String
    var description: String
    var quantity: Int
    var price: Double
    var tax: Double
    
}

