//
//  ErrorMessage.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 08/06/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import Foundation

enum GHError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server, please try again."
    case invalidData = "The data recieved from the server was invalid. Please try again"
}
