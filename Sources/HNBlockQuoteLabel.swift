//
//  File.swift
//  
//
//  Created by oneweek02 on 6/15/23.
//

import UIKit
import Foundation
import Splash
import SwiftRichString

class HNBlockQuoteLabel : UIView {
    var label : HNBlockCodeLabel? = nil
    var viewLine : UIView?
    var item : HNMarkDownItem!
    var options : HNMarkdownOption!

    init(item: HNMarkDownItem, options: HNMarkdownOption) {
        super.init(frame: .zero)
        self.item = item
        self.options = options
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SETUP
    func setUp(){
        
        if label == nil {
            self.label = HNBlockCodeLabel(item: item, options: self.options)
            self.addSubview(self.label!)
            self.label?.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview()
            }
            self.label?.setUp()
        }
        addLine()
    }

    func addLine(){
        if viewLine == nil {
            viewLine = UIView(frame: .zero)
            viewLine?.backgroundColor = options.blockBackground
            self.addSubview(viewLine!)
            viewLine?.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(4)
            }
        }
    }
    //MARK: - FUNC
    
    

    //MARK: - ACTION

}
