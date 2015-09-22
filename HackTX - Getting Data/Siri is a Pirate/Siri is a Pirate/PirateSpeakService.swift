import Foundation
let baseURL = "http://isithackday.com/arrpi.php"


func translateToPirateSpeak(text: String, callback: (String)->()) {
    let request = buildRequest(text)
   // TODO: Use the request to query the webservice and call the callback
   // with the response.

}

private func buildRequest(text: String) -> NSURLRequest {
    //TODO: Make a request
    return NSURLRequest()
}