//
//  HNSupportElements.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import Foundation

enum HNMarkDownType {
    case text, code, image , quote, line, table, latex
}
enum HNSupportElements : String {
    case italic = "*"
    case bold = "**"
    case strikethrough = "~"
    case header1 = "#"
    case header2 = "##"
    case header3 = "###"
    case header4 = "####"
    case header5 = "#####"
    case header6 = "######"
    case code = "```"
    case inlinecode = "`"
    case link
    case quote = ">"
    
    func addTag(from:String)->String {
        switch self {
        case .bold :
            return " <b>" + from + "</b> "
        
        case .italic :
            return " <i>" + from + "</i> "
        
        case .strikethrough:
            return " <s>" + from + "</s> "
            
        case .header1:
            return "<h1>" + from + "</h1>"
        case .header2:
            return "<h2>" + from + "</h2>"
        case .header3:
            return "<h3>" + from + "</h3>"
        case .header4:
            return "<h4>" + from + "</h4>"
        case .header5:
            return "<h5>" + from + "</h5>"
        case .header6:
            return "<h6>" + from + "</h6>"
            
        case .code:
            return from
            
        case .inlinecode:
            let f = from
                .replacingOccurrences(of: "<", with: "&lt;")
                .replacingOccurrences(of: ">", with: "&gt;")
            return " <f>" + f + "</f> "
        case .link:
            return ""
        case .quote:
            return from
        }
    }
    func addHref(link:String,text:String)->String{
        if self == .link {
            let ct = text.isEmpty ? link : text
            return " <a href=\"\(link)\">" + ct + "</a> "
        }else{
            return ""
        }
    }
}
