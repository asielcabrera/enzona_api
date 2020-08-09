import Alamofire
import Foundation


class enzona_api {
    
    var consumer_key: String
    var consumer_secret: String
    var token: String
    var SCOPE_PAYMENT = "enzona_business_payment"
    var SCOPE_QR = "enzona_business_qr"
    
    
    public init(consumer_key:String, consumer_secret:String){
        self.consumer_key = consumer_key
        self.consumer_secret = consumer_secret
        self.get_token()
        
    }
    
    func get_token() -> String {
        var url:String = "https://api.enzona.net/token"
        
        var b64:String = "\(credentials.consumer_key):\(credentials.consumer_secret)".toBase64()
        
        let headers: HTTPHeaders = [
                    "Authorization": "Basic \(b64)",
                    "Accept": "application/json",
                    "Content-Type":"application/json"
                ]
                
        AF.request(url, method: .post, parameters: Login(grant_type: "client_credentials", scope: self.SCOPE_PAYMENT),headers: headers ).responseJSON { response in
            let res = try! JSONDecoder().decode(login_data_response.self, from: response.data!)
            debugPrint(response)
            self.token = res.access_token
        }
        
    }
}


class enzona_business_payment: enzona_api {
    override init(consumer_key: String, consumer_secret: String) {
        super.init(consumer_key: consumer_key, consumer_secret: consumer_secret)
    }
    
    
    func create_payments(payment: Payment_Request, completion: @escaping () -> Void) -> Payment_Response {
        var url:String = "https://api.enzona.net/payment/v1.0.0/payments"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(self.token)",
            "Accept": "application/json",
            "Content-Type":"application/json"
        ]
        
        AF.request(url, method: .post, parameters: payment,headers: headers ).responseJSON { response in
            let res = try! JSONDecoder().decode(Payment_Response.self, from: response.data!)
            debugPrint(res)
            completion(res)
        }
    }
}
