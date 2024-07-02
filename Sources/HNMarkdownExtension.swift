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
            str.removeFirst(element.rawValue.count)
            str.removeLast(element.rawValue.count)
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
    class func monoRegular(size:CGFloat)->UIFont{
        return UIFont(name: "SpaceMono-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    class func register(){
        guard let asset = NSDataAsset(name: "SpaceMono-Regular", bundle: Bundle.module),
              let provider = CGDataProvider(data: asset.data as NSData),
              let font = CGFont(provider),
              CTFontManagerRegisterGraphicsFont(font, nil) else {
            print("register font error")
            return
        }
    }
}
