//
//  File.swift
//  
//
//  Created by oneweek02 on 6/20/23.
//

import Foundation
import UIKit

class HNThematicBreak : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp(options:HNMarkdownOption){
        self.backgroundColor = options.thematicBreakColor
    }
}
