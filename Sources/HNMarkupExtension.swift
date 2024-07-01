//
//  File.swift
//  
//
//  Created by oneweek02 on 6/13/23.
//

import Foundation
import Markdown

enum LatexContentType {
    case paragraph(String)
    case latex(String)
}

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
        }else if let text = self as? Text {
            return (text.plainText,false)
        }else if let text = self as? SoftBreak {
//            print("SoftBreak = \(text.plainText)")
            return (text.plainText,false)
        }else if let text = self as? LineBreak {
//            print("LineBreak = \(text.plainText)")
            return (text.plainText,false)
        }else if let quote = self as? BlockQuote {
            return (quote.getChildFormat(),false)
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
    
    
    func extractLaTeXAndMarkdown() -> [LatexContentType] {
        let text = getFormat().text
        // Regular expression patterns for LaTeX
        let latexPatterns = [
            "\\$\\$[\\s\\S]+?\\$\\$", // Matches $$ ... $$ (multi-line)
            "\\\\\\([\\s\\S]+?\\\\\\)", // Matches \( ... \) (inline LaTeX)
            "\\$[\\s\\S]+?\\$" // Matches $ ... $ (inline LaTeX)
        ]
        
        // Combine patterns
        let combinedPattern = latexPatterns.joined(separator: "|")
        
        // Regular expression to find LaTeX
        let regex = try! NSRegularExpression(pattern: combinedPattern, options: [])
        
        // Find matches
        let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
        
        // Extract LaTeX strings and their ranges
        var latexStrings: [(String, NSRange)] = []
        
        for match in matches {
            if let range = Range(match.range, in: text) {
                latexStrings.append((String(text[range]), match.range))
            }
        }
        
        // Sort the matches by range location
        latexStrings.sort { $0.1.location < $1.1.location }
        
        var result: [LatexContentType] = []
        var lastPosition = text.startIndex
        
        for (latex, range) in latexStrings {
            let rangeStartIndex = text.index(text.startIndex, offsetBy: range.location)
            let rangeEndIndex = text.index(text.startIndex, offsetBy: range.location + range.length)
            
            if lastPosition < rangeStartIndex {
                let substring = String(text[lastPosition..<rangeStartIndex]).trimmingCharacters(in: .whitespacesAndNewlines)
                if !substring.isEmpty {
                    result.append(.paragraph(substring))
                }
            }
            
            result.append(.latex(latex))
            lastPosition = rangeEndIndex
        }
        
        if lastPosition < text.endIndex {
            let substring = String(text[lastPosition..<text.endIndex]).trimmingCharacters(in: .whitespacesAndNewlines)
            if !substring.isEmpty {
                result.append(.paragraph(substring))
            }
        }
        
        return result
    }
}
extension String {
    func extractLaTeXAndMarkdown() -> [LatexContentType] {
        let text = self
        // Regular expression patterns for LaTeX
        let latexPatterns = [
            "\\$\\$[\\s\\S]+?\\$\\$", // Matches $$ ... $$ (multi-line)
            "\\\\\\([\\s\\S]+?\\\\\\)", // Matches \( ... \) (inline LaTeX)
            "\\$[\\s\\S]+?\\$" // Matches $ ... $ (inline LaTeX)
        ]
        
        // Combine patterns
        let combinedPattern = latexPatterns.joined(separator: "|")
        
        // Regular expression to find LaTeX
        let regex = try! NSRegularExpression(pattern: combinedPattern, options: [])
        
        // Find matches
        let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
        
        // Extract LaTeX strings and their ranges
        var latexStrings: [(String, NSRange)] = []
        
        for match in matches {
            if let range = Range(match.range, in: text) {
                latexStrings.append((String(text[range]), match.range))
            }
        }
        
        // Sort the matches by range location
        latexStrings.sort { $0.1.location < $1.1.location }
        
        var result: [LatexContentType] = []
        var lastPosition = text.startIndex
        
        for (latex, range) in latexStrings {
            let rangeStartIndex = text.index(text.startIndex, offsetBy: range.location)
            let rangeEndIndex = text.index(text.startIndex, offsetBy: range.location + range.length)
            
            if lastPosition < rangeStartIndex {
                let substring = String(text[lastPosition..<rangeStartIndex]).trimmingCharacters(in: .whitespacesAndNewlines)
                if !substring.isEmpty {
                    result.append(.paragraph(substring))
                }
            }
            
            result.append(.latex(latex))
            lastPosition = rangeEndIndex
        }
        
        if lastPosition < text.endIndex {
            let substring = String(text[lastPosition..<text.endIndex]).trimmingCharacters(in: .whitespacesAndNewlines)
            if !substring.isEmpty {
                result.append(.paragraph(substring))
            }
        }
        
        return result
    }
    
}
