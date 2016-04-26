//
//  webservices.swift
//  openlibrary
//
//  Created by Jorge Cozain on 06/03/16.
//  Copyright © 2016 Jorge Cozain. All rights reserved.
//

import Foundation

func bookInformation(ISBN: String, completion:(information:NSData?, error:NSError?)->Void){
    
    let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(ISBN)"
    let url = NSURL(string: urls)
    let sesion = NSURLSession.sharedSession()
    let block = {(data: NSData?, response:NSURLResponse?, error:NSError?)-> Void in
        completion(information: data, error: error)
    }
    let dt = sesion.dataTaskWithURL(url!, completionHandler: block)
    dt.resume()
}