//
//  File.swift
//  
//
//  Created by oneweek02 on 5/15/23.
//

import Foundation
import UIKit

class HNBlockCodeView : UIView {
    var label : HNBlockCodeLabel? = nil
    var item : HNMarkDownItem?
    var options = HNMarkdownOption()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - SETUP
    func setUp(item:HNMarkDownItem,options:HNMarkdownOption){
        self.item = item
        self.options = options
        self.addLabel(item: item , options: options)
        
        if item.type == .code {
            backgroundColor = options.codeBackground
            layer.cornerRadius = 8
            layer.masksToBounds = true
            createCopyButton()
        }
    }
    //MARK: - LAYOUT
    
    func addLabel(item:HNMarkDownItem,options:HNMarkdownOption){
        label = HNBlockCodeLabel(frame: .zero)
        self.addSubview(label!)
        if item.type == .code {
            label?.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(30)
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-8)
                make.bottom.equalToSuperview().offset(-8)
            }
        }else{
            label?.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        label?.setUp(item: item, options: options)
    }
    
    func createCopyButton(){
        let btn = UIButton(frame: CGRect(x: frame.width - 30, y: 0, width: 30, height: 30))
        btn.setImage(self.options.copyImage, for: .normal)
        btn.setImage(self.options.copyDoneImage, for: .selected)
        btn.tintColor = self.options.tintColorCopyButton
        btn.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        btn.addTarget(self , action: #selector(self.selectedCopyButton(_:)), for: .touchUpInside)
        self.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.height.equalTo(30)
        }
    }
    //MARK: - FUNC
    
    //MARK: - ACTION
    @objc func selectedCopyButton(_ sender:UIButton){
        UIPasteboard.general.string = item?.content ?? ""
        print("copied content to clipboard!")
        sender.animationCopyButton()
    }
}
