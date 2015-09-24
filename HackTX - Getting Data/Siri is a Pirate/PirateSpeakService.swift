import Foundation
let baseURL = "http://isithackday.com/arrpi.php"


func translateToPirateSpeak(text: String, callback: (String)->()) {
    let request = buildRequest(text)
   let task =  NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
        let coerced = String(data: data!, encoding: NSUTF8StringEncoding)!
        callback(coerced)

    }
    task.resume()

}

private func buildRequest(text: String) -> NSURLRequest {
    let escapedText = (text as NSString).stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
    let request = NSMutableURLRequest()
    request.HTTPMethod = "GET"
    let fullURL = baseURL + "?text='\(escapedText)'"
    request.URL = NSURL(string: fullURL)
    return request
}