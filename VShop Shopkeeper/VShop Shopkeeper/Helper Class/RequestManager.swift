//
//  RequestManager.swift
//  GlamBolt
//
//  Created by RAS2 on 05/12/17.
//  Copyright © 2017 RAS2. All rights reserved.
//

import UIKit

import Alamofire
import MBProgressHUD

class RequestManager: NSObject {
    
    
    class func getAPIWithURLString (urlPart : String,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        var finalUrl = Constant.baseURL.apiBaseUrl + urlPart
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print("\n\nfinal URL For Get is \(finalUrl) \n\n")
        Alamofire.request(finalUrl,headers:nil).responseJSON { (response) in
            print("\n\n RESPONSE IS \n \(response)")
            if response.result.isSuccess{
                successResult(response.result.value!, (response.response?.statusCode)!)
            }else{
                failureResult(response.result.error!)
            }
        }
    }
    
    class func getAPIWithURLStringForMap (urlPart : String,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        Utility.showHud()
        var finalUrl =  urlPart
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print("\n\nfinal URL For Get is \(finalUrl) \n\n")
        Alamofire.request(finalUrl,headers:nil).responseJSON { (response) in
            print("\n\n RESPONSE IS \n \(response)")
            if response.result.isSuccess{
                successResult(response.result.value!, (response.response?.statusCode)!)
            }else{
                failureResult(response.result.error!)
            }
        }
    }
    
    class func getAPIForNotificationCount(urlPart : String,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        var finalUrl = Constant.baseURL.apiBaseUrl + urlPart
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print("\n\nfinal URL For Get is \(finalUrl) \n\n")
        Alamofire.request(finalUrl).responseJSON { (response) in
            print("\n\n RESPONSE IS \n \(response)")
            if response.result.isSuccess{
                successResult(response.result.value!, (response.response?.statusCode)!)
            }else{
                failureResult(response.result.error!)
            }
        }
    }
    
    class func getAPINewsfeedWithURLString(urlPart: String, successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        
        var finalUrl = Constant.baseURL.apiBaseUrl + urlPart
        
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        print("\n\nfinal URL For Get is \(finalUrl) \n\n")
        Alamofire.request(finalUrl).responseString(completionHandler: { (response) in
            Utility.hideHud()
            print("\n\n RESPONSE IS \n \(response)")
            if response.result.isSuccess{
                successResult(response.result.value!, (response.response?.statusCode)!)
            } else {
                failureResult(response.result.error!)
            }
        })
    }
    
    class func postAPI(urlPart:String,parameters:Dictionary<String,Any>,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        
        var finalUrl = Constant.baseURL.apiBaseUrl + urlPart
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print("\n\nfinal URL For POST is \(finalUrl) \n AND Parameters are \n\(parameters)\n\n")
        
        Alamofire.request(finalUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON
            /*Alamofire.request(finalUrl,method:.post,parameters:parameters).responseJSON */{ (response) in
                //   Utility.hideHud()
                
                print("\n\n RESPONSE IS \n \(response)")
                if response.result.isSuccess{
                    successResult(response.result.value!, (response.response?.statusCode)!)
                }else{
                    failureResult(response.result.error!)
                }
        }
    }
    
    
    class func postAPIS(urlPart:String,parameters:Dictionary<String,Any>,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        
        var finalUrl = Constant.baseURL.apiBaseUrl + urlPart
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print("\n\nfinal URL For POST is \(finalUrl) \n AND Parameters are \n\(parameters)\n\n")
        
        Alamofire.request(finalUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseString(completionHandler: { (response) in
            
            print("\n\n RESPONSE IS \n \(response)")
            if response.result.isSuccess{
                successResult(response.result.value!, (response.response?.statusCode)!)
            }else{
                failureResult(response.result.error!)
            }
        })
    }
    
    class func postAPIWithHeader(urlPart:String,parameters:Dictionary<String,Any>,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        
        var finalUrl = Constant.baseURL.apiBaseUrl + urlPart
        
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print("\n\nfinal URL For POST is \(finalUrl) \n AND Parameters are \n\(parameters)\n\n")
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : "Bearer \(UserDefaults.standard.value(forKey:"token") as? String ?? "")"
        ]
        
        Alamofire.request(finalUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON
            /*Alamofire.request(finalUrl,method:.post,parameters:parameters).responseJSON */{ (response) in
                
                print("\n\n RESPONSE IS \n \(response)")
                if response.result.isSuccess{
                    successResult(response.result.value!, (response.response?.statusCode)!)
                }else{
                    failureResult(response.result.error!)
                }
        }
    }
    
    class func postAPIForClickieWithAttachment(view:UIView,urlPart:String,arrImages:[String : Any],parameters:Dictionary<String,Any>,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        
        var finalUrl = Constant.baseURL.apiBaseUrl + urlPart
        let appDelegate = UIApplication.shared.delegate
        
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        print("\n\nfinal URL For POST is \(finalUrl) \n AND Parameters are \n\(parameters)\n\n")
        //let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        //progressHUD.mode = .annularDeterminate
        //progressHUD.label.text = "Uploading"
        Utility.showHud()
        
        let headers: HTTPHeaders = [
            "Content-type": ""
        ]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key,value) in parameters {
                if let data = String(describing: value).data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)){
                    multipartFormData.append(data, withName: key)
                }
            }
            
            //            for i in 0..<arrImages.count {
            //                let dict = arrImages[0] as! NSDictionary
            
            let imageData = (arrImages["Image"] as! UIImage).pngData() //UIImageJPEGRepresentation(dict["Image"] as! UIImage, 0.5)
            if imageData != nil {
                // print(dict)
                print(imageData!)
                multipartFormData.append(imageData!, withName: arrImages["ParameterName"] as! String, fileName: "\(arrImages["Name"] as! String).png", mimeType: "image/png")
            }
            // }
        }, usingThreshold: UInt64.init(), to: finalUrl, method: .post, headers:headers) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    //Print progress
                    //progressHUD.progress = Float(progress.fractionCompleted)
                    print(progress)
                })
                
                upload.responseJSON { response in
                    //print response.result
                    
                    if let JSON = response.result.value {
                        print(JSON)
                        //                        print(response.result.value!)
                        //progressHUD.hide(animated: true)
                        Utility.hideHud()
                        successResult(response.result.value!, (response.response?.statusCode)!)
                    }
                    //                     MBProgressHUD.hide(for: ((appDelegate?.window)!)!, animated: true)
                }
                
            case .failure(let encodingError):
                //print encodingError.description
                print(encodingError)
                failureResult(encodingError)
                MBProgressHUD.hide(for: ((appDelegate?.window)!)!, animated: true)
            }
        }
    }
    
    class func postAPIWithAttachmentMedia(view:UIView,urlPart:String,arrImages:NSArray,fileUrl:URL?, thumbnailImage: UIImage, parameters:Dictionary<String,Any>,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        
        var finalUrl = Constant.baseURL.apiBaseUrl + urlPart
        
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        print("\n\nfinal URL For POST is \(finalUrl) \n AND Parameters are \n\(parameters)\n\n")
        
        var progressHUD = MBProgressHUD()
        
        DispatchQueue.main.async {
            progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
            progressHUD.mode = .annularDeterminate
            progressHUD.label.text = "Uploading"
        }
        
        //Utility.showHud()
        
        let headers: HTTPHeaders = [
            "Content-type": ""
        ]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key,value) in parameters {
                if let data = String(describing: value).data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)){
                    multipartFormData.append(data, withName: key)
                }
            }
            
            if fileUrl != nil{
                //multipartFormData.append(fileUrl.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: "UploadVideo", fileName: "video.mov", mimeType: "video/quicktime")
                multipartFormData.append(fileUrl!, withName: "UploadVideo", fileName: "video.mov", mimeType: "video/quicktime")
                let imageData = thumbnailImage.jpegData(compressionQuality: 0.5) // UIImageJPEGRepresentation(thumbnailImage, 0.5)
                if imageData != nil {
                    print(imageData!)
                    multipartFormData.append(imageData!, withName: "UploadThumbnail", fileName: "VideoThumbnail.png", mimeType: "image/png")
                }
            }
            else{
                
                for i in 0..<arrImages.count {
                    let dict = arrImages[i] as! NSDictionary
                    let image = dict["Image"] as? UIImage
                    let imageData = image?.jpegData(compressionQuality: 0.5)//UIImagePNGRepresentation(dict["Image"] as! UIImage)
                    if imageData != nil {
                        print(dict)
                        print(imageData!)
                        multipartFormData.append(imageData!, withName: "UploadPhoto", fileName: "\(dict["Name"] as! String).png", mimeType: "image/png")
                    }
                }
            }
            
        }, usingThreshold: UInt64.init(), to: finalUrl, method: .post, headers:headers) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    //Print progress
                    progressHUD.progress = Float(progress.fractionCompleted)
                    print(progress)
                })
                
                upload.responseJSON { response in
                    //print response.result
                    
                    if let JSON = response.result.value {
                        print(JSON)
                        //                        print(response.result.value!)
                        DispatchQueue.main.async {
                            progressHUD.hide(animated: true)
                        }
                        //Utility.hideHud()
                        successResult(response.result.value!, (response.response?.statusCode)!)
                    }
                    //                     MBProgressHUD.hide(for: ((appDelegate?.window)!)!, animated: true)
                }
                
            case .failure(let encodingError):
                //print encodingError.description
                print(encodingError)
                failureResult(encodingError)
                DispatchQueue.main.async {
                    progressHUD.hide(animated: true)
                }
                //MBProgressHUD.hide(for: ((appDelegate?.window)!)!, animated: true)
            }
        }
    }
    
    //MARK:- POST API WITH SINGLE ATTACHMENT
    
    class func postAPIWithSingleAttachmentMedia(view:UIView,urlPart:String,parameterImage:[String:UIImage],fileUrl:URL?, thumbnailImage: UIImage, parameters:Dictionary<String,Any>,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        
        var finalUrl = Constant.baseURL.apiBaseUrl + urlPart
        
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        print("\n\nfinal URL For POST is \(finalUrl) \n AND Parameters are \n\(parameters)\n\n")
        
        Utility.showHud()
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : "Bearer \(UserDefaults.standard.value(forKey:"token") as? String ?? "")"
        ]
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key,value) in parameters {
                if let data = String(describing: value).data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)){
                    multipartFormData.append(data, withName: key)
                }
            }
            for (_,value) in parameterImage {
                let timeStamp = Date().timeIntervalSince1970 * 1000
                let imageData = value.jpegData(compressionQuality: 0.5)//UIImagePNGRepresentation(dict["Image"] as! UIImage)
                if imageData != nil {
                    print(imageData!)
                    multipartFormData.append(imageData!, withName: "image", fileName: "image\(timeStamp).png", mimeType: "image/png")
                }
            }
            
        }, usingThreshold: UInt64.init(), to: finalUrl, method: .post, headers:header) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    //print response.result
                    
                    if let JSON = response.result.value {
                        print(JSON)
                        
                        successResult(response.result.value!, (response.response?.statusCode)!)
                    }
                }
                
            case .failure(let encodingError):
                //print encodingError.description
                print(encodingError)
                failureResult(encodingError)
            }
        }
    }
    class func getAPIWithoutLoaderWithURLString (urlPart : String,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        var finalUrl = Constant.baseURL.apiBaseUrl + urlPart
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print("\n\nfinal URL For Get is \(finalUrl) \n\n")
        Alamofire.request(finalUrl).responseJSON { (response) in
            print("\n\n RESPONSE IS \n \(response)")
            if response.result.isSuccess{
                successResult(response.result.value!, (response.response?.statusCode)!)
            }else{
                failureResult(response.result.error!)
            }
        }
    }
    class func postAPIWithoutBaseURL (urlPart:String,parameters:Dictionary<String,Any>,successResult:@escaping SuccessHandler,failureResult:@escaping FailureHandler){
        
        var finalUrl = urlPart
        let appDelegate = UIApplication.shared.delegate
        
        finalUrl = finalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print("\n\nfinal URL For POST is \(finalUrl) \n AND Parameters are \n\(parameters)\n\n")
        
        Alamofire.request(finalUrl,method:.post,parameters:parameters).responseJSON { (response) in
            MBProgressHUD.hide(for: ((appDelegate?.window)!)!, animated: true)
            print("\n\n RESPONSE IS \n \(response)")
            if response.result.isSuccess{
                successResult(response.result.value!, (response.response?.statusCode)!)
            }else{
                failureResult(response.result.error!)
            }
        }
    }
}
