//
//  HNFont.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 5/10/23.
//


#if canImport(UIKit)

import UIKit

#endif

enum HNFont : String {
    case AvenirNextRegular = "AvenirNext-Regular"
    case AvenirNextMedium = "AvenirNext-Medium"
    case AvenirNextBold = "AvenirNext-Bold"
    case AvenirNextItalic = "AvenirNext-Italic"
    
    case HelveticaNeue = "HelveticaNeue"
    case HelveticaNeueMedium = "HelveticaNeue-Medium"
    case HelveticaNeueLight = "HelveticaNeue-Light"
    case HelveticaNeueBold = "HelveticaNeue-Bold"
    case HelveticaNeueLightItalic = "HelveticaNeue-LightItalic"
    case HelveticaNeueThin = "HelveticaNeue-Thin"
        
//    Font Family Name = [Arial]
//    Font Names = [["Arial-BoldMT", "Arial-BoldItalicMT", "Arial-ItalicMT", "ArialMT"]]
    case Arial = "Arial"
    case ArialBold = "Arial-BoldMT"
    
    case SpaceMonoRegular = "SpaceMono-Regular"
    
    func size(_ size:CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size) ?? UIFont(name: "HelveticaNeue", size: size)!
    }
}

extension UIFont {
    class func font(_ name:HNFont,_ size:CGFloat)->UIFont{
        return UIFont(name: name.rawValue, size: size)!
    }
    
    class func printFonts() {
        
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName )
            print("Font Names = [\(names)]")
        }
    }
}
