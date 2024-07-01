//
//  File.swift
//  
//
//  Created by TrungOW on 26/6/24.
//

import Foundation
import UIKit

class HNHeaderBlockCode : UIView {
    var options : HNMarkdownOption!
    
    init(options: HNMarkdownOption) {
        super.init(frame: .zero)
        self.options = options
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(language:String,action: Selector,target:Any){
        self.backgroundColor = options.codeHeaderBackground
        
        let btn = UIButton(frame: .zero)
        btn.setImage(self.options.copyImage, for: .normal)
        btn.setImage(self.options.copyDoneImage, for: .selected)
        btn.setTitle(" Copy", for: .normal)
        btn.setTitle("Copied", for: .selected)
        btn.setTitleColor(self.options.tintColorCopyButton, for: .normal)
        btn.setTitleColor(self.options.tintColorCopyButton, for: .selected)
        btn.tintColor = self.options.tintColorCopyButton
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(target , action: action, for: .touchUpInside)
        self.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(30)
        }
        
        let labelTitle = UILabel(frame: .zero)
        labelTitle.text = language
        labelTitle.textColor = options.colorText
        labelTitle.font = options.fontBold
        self.addSubview(labelTitle)
        labelTitle.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
        }
        labelTitle.sizeToFit()
    }
}
