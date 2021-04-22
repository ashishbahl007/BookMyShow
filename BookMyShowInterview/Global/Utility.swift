//
//  Utility.swift
//  BookMyShowInterview
//
//  Created by Ashish Bahl on 22/04/21.
//

import UIKit

open class Utility : NSObject {
 
    //MARK:- Create Alert
    
    static public func createAlert(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK:- Download image from URL
    
    static public func downloadImage(imageURL: String,imageView : UIImageView) {
        if let imageURL = URL(string: imageURL) {
            let session = URLSession(configuration: .default)
            let downloadPicTask = session.dataTask(with: imageURL) { (data, response, error) in
                if let e = error {
                    self.createAlert(e.localizedDescription)
                } else {
                    if let res = response as? HTTPURLResponse {
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            DispatchQueue.main.async {
                                imageView.image = image
                            }
                        } else {
                            self.createAlert("Couldn't get image: Image is nil")
                        }
                    } else {
                        self.createAlert("Couldn't get response code for technical reasons")
                    }
                }
            }
            downloadPicTask.resume()
        }
    }
}
