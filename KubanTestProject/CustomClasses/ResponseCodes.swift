//
//  ResponseCodes.swift
//  KubanTestProject
//
//  Created by Roman Efimov on 19/09/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import Foundation

class ResponseCodes{
    
    func getCodeDescription(code: Int) -> String{
        var status = ""
        
        switch code {
        case 100:
            status = "Continue"
        case 101:
            status = "Switching Protocols"
        case 102:
            status = "Processing"
            
            
        case 200:
            status = "Ok"
        case 201:
            status = "Created"
        case 202:
            status = "Accepted"
        case 203:
            status = "Non-Authoritative Information"
        case 204:
            status = "No Content"
        case 205:
            status = "Reset Content"
        case 206:
            status = "Partial Content"
        case 207:
            status = "Multi-Status"
        case 208:
            status = "Already Reported"
        case 226:
            status = "IM Used"
            
            
        case 300:
            status = "Ok"
        case 301:
            status = "Moved Permanently"
        case 302:
            status = "Moved Temporarily"
        case 303:
            status = "See Other"
        case 304:
            status = "Not Modified"
        case 305:
            status = "Use Proxy"
        case 307:
            status = "Temporary Redirect"
        case 308:
            status = "Permanent Redirect"
            
                    
        case 400:
            status = "Bad Request"
        case 401:
            status = "Unauthorized"
        case 402:
            status = "Payment Required"
        case 403:
            status = "Forbidden"
        case 404:
            status = "Not Found"
        case 405:
            status = "Method Not Allowed"
        case 406:
            status = "Not Acceptable"
        case 407:
            status = "Proxy Authentication Required"
        case 408:
            status = "Request Timeout"
        case 409:
            status = "Conflict"
        case 410:
            status = "Gone"
        case 411:
            status = "Length Required"
        case 412:
            status = "Precondition Failed"
        case 413:
            status = "Payload Too Large"
        case 414:
            status = "URI Too Long"
        case 415:
            status = "Unsupported Media Type"
        case 416:
            status = "Range Not Satisfiable "
        case 417:
            status = "Expectation Failed "
        case 418:
            status = "I’m a teapot"
        case 419:
            status = "Authentication Timeout"
        case 421:
            status = "Misdirected Request"
        case 422:
            status = "Unprocessable Entity"
        case 423:
            status = "Locked"
        case 424:
            status = "Failed Dependency"
        case 426:
            status = "Upgrade Required"
        case 428:
            status = "Precondition Required"
        case 429:
            status = "Too Many Requests"
        case 431:
            status = "Request Header Fields Too Large"
        case 449:
            status = "Retry With"
        case 451:
            status = "Unavailable For Legal Reasons"
        case 452:
            status = "Bad sended request"
        case 499:
            status = "Client Closed Request"
            
            
        case 500:
            status = "Internal Server Error "
        case 501:
            status = "Not Implemented"
        case 502:
            status = "Bad Gateway"
        case 503:
            status = "Service Unavailable"
        case 504:
            status = "Gateway Timeout "
        case 505:
            status = "HTTP Version Not Supported"
        case 506:
            status = "Variant Also Negotiates "
        case 507:
            status = "Insufficient Storage"
        case 508:
            status = "Loop Detected"
        case 509:
            status = "Bandwidth Limit Exceeded"
        case 510:
            status = "Not Extended"
        case 511:
            status = "Network Authentication Required"
        case 520:
            status = "Unknown Error"
        case 521:
            status = "Web Server Is Down"
        case 522:
            status = "Connection Timed Out"
        case 523:
            status = "Origin Is Unreachable"
        case 524:
            status = "A Timeout Occurred"
        case 525:
            status = "SSL Handshake Failed"
        case 526:
            status = "Invalid SSL Certificate"
            
        default:
            status = "Unknown status"
        }
        return status
    }
    
}
