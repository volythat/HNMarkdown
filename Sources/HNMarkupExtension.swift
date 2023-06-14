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
            return (self.getChildFormat().removeElement(element: .italic),false)
        }else if self is Strong {
            return (self.getChildFormat().removeElement(element: .bold),false)
        }else if self is Strikethrough {
            return (self.getChildFormat().removeElement(element: .strikethrough),false)
        }else if self is InlineCode {
            return (self.getChildFormat().removeElement(element: .inlinecode),false)
        }else if let link = self as? Link {
            let fm = HNSupportElements.link.addHref(link: link.destination ?? "", text: link.plainText)
            return (fm,false)
        }else if let image = self as? Image {
            return (image.source ?? "",true)
        }else if self is Text {
            return (self.getChildFormat(),false)
        }else{
            return (self.getChildFormat(),false)
        }
    }
    func getChildFormat()->String{
        var str = ""
        if childCount > 0 {
            children.forEach { child in
                str += child.getFormat().text
            }
        }else{
            str = format()
        }
        return str
    }
}
