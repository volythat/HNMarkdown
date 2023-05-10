//
//  HNMarkdownExtension.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//

import Foundation
import UIKit

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
        let count = element.rawValue.count
        if str.prefix(count) == element.rawValue {
            str = str.substring(from: count, length: str.count - count) ?? str
            if str.suffix(count) == element.rawValue {
                str = str.substring(from: 0, length: str.count - count) ?? str
            }
        }
        return element.addTag(from: str)
    }
}
