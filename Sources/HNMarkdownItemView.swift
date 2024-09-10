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
    var table : HNScrollTableView? = nil
    var imageView : HNImageView? = nil
    var headerCode : HNHeaderBlockCode? = nil
    var latex : HNLatexLabel? = nil
    
    var item : HNMarkDownItem?
    var options : HNMarkdownOption!
    
    public var didSelectedLink : ((_ url:URL)->Void)?
    public var didSelectedImage : ((_ image:UIImage)->Void)?
    public var updatedHeight : ((_ height:CGFloat)->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(options:HNMarkdownOption){
        super.init(frame: .zero)
        self.options = options
    }
    
    //MARK: - SETUP
    func setUp(item:HNMarkDownItem){
        self.item = item
        self.addLabel(item: item , options: options)
        
        if item.type == .code {
            backgroundColor = options.codeBackground
            layer.cornerRadius = 8
            layer.masksToBounds = true
            createCopyButton(language: item.language)
        }
    }
    
    //MARK: - LAYOUT
    
    func addLabel(item:HNMarkDownItem,options:HNMarkdownOption){
        
        if item.type == .code {
            label = HNBlockCodeLabel(item: item, options: options)
            self.addSubview(label!)
            label?.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(30)
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-8)
                make.bottom.equalToSuperview()
            }
            label?.delegate = self 
            label?.setUp()
        }else if item.type == .quote {
            quote = HNBlockQuoteLabel(item: item, options: options)
            self.addSubview(quote!)
            quote?.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(30)
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-8)
                make.bottom.equalToSuperview()
            }
            quote?.setUp()
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
                self?.updatedHeight?(0)
            }
            
        }else if item.type == .table {
            table = HNScrollTableView(options: options, item: item)
            self.addSubview(self.table!)
            table?.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(8)
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-8)
                make.height.equalTo(50)
            }
            table?.setUp()
            table?.didAdded = { [weak self] h in
                self?.table?.snp.updateConstraints({ make in
                    make.height.equalTo(h)
                })
                self?.updatedHeight?(h)
            }
        }else if item.type == .latex {
            latex = HNLatexLabel(item: item, options: options)
            self.addSubview(self.latex!)
            latex?.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(8)
                make.bottom.equalToSuperview().offset(-8)
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-8)
            }
            latex?.setUp()
        }else{
            
            label = HNBlockCodeLabel(item: item, options: options)
            self.addSubview(label!)
            label?.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            label?.delegate = self
            label?.setUp()
        }
    }
    
    func createCopyButton(language:String){
        self.headerCode = HNHeaderBlockCode(options: self.options)
        self.headerCode?.setUp(language: language , action: #selector(self.selectedCopyButton(_:)),target: self)
        self.addSubview(self.headerCode!)
        self.headerCode?.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(30)
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
