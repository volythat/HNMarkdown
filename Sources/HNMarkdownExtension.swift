//
//  HNMarkdownExtension.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import Foundation
import UIKit
import SafariServices

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
    
    func removeElement(element:HNSupportElements)->String{
        var str = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if str.hasPrefix(element.rawValue) , str.hasSuffix(element.rawValue) {
            if str.contains(element.rawValue){
                str.removeFirst(element.rawValue.count)
            }
            if str.contains(element.rawValue){
                str.removeLast(element.rawValue.count)
            }
        }

        return element.addTag(from: str)
        
    }
    func removeElementQuote(element:HNSupportElements)->String{
        
        var str = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if str.hasPrefix(element.rawValue) {
            str.removeFirst(element.rawValue.count)
        }
        return str
    }
    func removeFirstAndLastCharacter() -> String {
        guard self.count > 1 else {
            // If the text has 0 or 1 characters, return an empty string
            return self
        }
        
        // Remove the first and last characters
        if let first = self.first , first == "[" ,
           let last = self.last , last == "]" {
            let result = self.dropFirst().dropLast()
            return String(result)
        }else{
            return self
        }
        
    }
    
    
}
extension UIButton {
    func fade(){
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0.1
        } completion: { _ in
            self.isSelected = true
            self.alpha = 1
            
        }

    }
    func animationCopyButton(){
        isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0.1
        } completion: { _ in
            self.isSelected = true
            self.alpha = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.isSelected = false
                self.isUserInteractionEnabled = true
            }
        }
        
    }
}

extension HNMarkdown {
    func logDebug(_ message:String){
        if isDebug {
            print("\n❗️❗️❗️ \(#function)(\(#line)) : \(message)\n")
        }
    }
}
extension UIFont {

    class func fontWithTraits(from fontName: String, size: CGFloat, traits: UIFontDescriptor.SymbolicTraits = []) -> UIFont? {
        guard let baseFont = UIFont(name: fontName, size: size) else { return nil }
        let descriptor = baseFont.fontDescriptor.withSymbolicTraits(traits)
        return descriptor.flatMap { UIFont(descriptor: $0, size: size) }
    }
    
    class func fontRegular(_ name:String,size:CGFloat)->UIFont{
        return fontWithTraits(from: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func fontBold(_ name:String,size:CGFloat)->UIFont{
        return fontWithTraits(from: name, size: size, traits: .traitBold) ?? UIFont.boldSystemFont(ofSize: size)
    }
    class func fontItalic(_ name:String,size:CGFloat)->UIFont{
        return fontWithTraits(from: name, size: size, traits: .traitItalic) ?? UIFont.italicSystemFont(ofSize: size)
    }
}
