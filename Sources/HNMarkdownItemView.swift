//
//  File.swift
//  
//
//  Created by oneweek02 on 5/15/23.
//

import Foundation
import UIKit
import SDWebImage

class HNMarkdownItemView : UIView {
    var label : HNBlockCodeLabel? = nil
    var quote : HNBlockQuoteLabel? = nil
    var imageView : HNImageView? = nil
    var item : HNMarkDownItem?
    var options = HNMarkdownOption()
    
    public var didSelectedLink : ((_ url:URL)->Void)?
    public var didSelectedImage : ((_ image:UIImage)->Void)?
    public var updatedHeight : (()->Void)?
    
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
        
        if item.type == .code {
            label = HNBlockCodeLabel(frame: .zero)
            self.addSubview(label!)
            label?.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(30)
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-8)
                make.bottom.equalToSuperview()
            }
            label?.setUp(item: item, options: options)
        }else if item.type == .quote {
            quote = HNBlockQuoteLabel(frame: .zero)
            self.addSubview(quote!)
            quote?.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(30)
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-8)
                make.bottom.equalToSuperview()
            }
            quote?.setUp(item: item, options: options)
        } else if item.type == .image {
            imageView = HNImageView(frame: .zero)
            imageView?.setImage(item.content,options: options)
            self.addSubview(imageView!)
            imageView?.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(0)
                make.trailing.equalToSuperview().offset(-0)
                
                make.top.equalToSuperview().offset(4)
                make.bottom.equalToSuperview().offset(-4)
                make.height.equalTo(300)
            }
            imageView?.didTaped = { [weak self] image in
                self?.didSelectedImage?(image)
            }
            imageView?.updatedHeight = { [weak self] in
                self?.updatedHeight?()
            }
            
        }else{
            label = HNBlockCodeLabel(frame: .zero)
            self.addSubview(label!)
            label?.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            label?.delegate = self
            label?.setUp(item: item, options: options)
        }
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
        sender.animationCopyButton()
    }
}
extension HNMarkdownItemView : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        self.didSelectedLink?(URL)
        return false
    }
}
