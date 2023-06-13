//
//  File.swift
//  
//
//  Created by oneweek02 on 6/13/23.
//

import Foundation
import Markdown


extension Markup {
    func sourceImage()->String? {
        if let img = self as? Image {
            return img.source
        }else{
            return nil
        }
    }
    
    func getFormat()->(text:String,isImage:Bool){
        if self is Emphasis {
            return (self.format().removeElement(element: .italic),false)
        }else if self is Strong {
            return (self.format().removeElement(element: .bold),false)
        }else if self is Strikethrough {
            return (self.format().removeElement(element: .strikethrough),false)
        }else if self is InlineCode {
            return (self.format().removeElement(element: .inlinecode),false)
        }else if self is Link {
            return (self.format().removeElement(element: .link),false)
        }else if let image = self as? Image {
            return (image.source ?? "",true)
        }else if self is Text {
            return (self.format(),false)
        }else{
            return (self.format(),false)
        }
        
    }
}
