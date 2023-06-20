//
//  File.swift
//  
//
//  Created by oneweek02 on 6/13/23.
//

import UIKit
import Foundation
import SDWebImage

class HNImageView : UIImageView {
    
    var urlString = ""
    var didTaped : ((_ image:UIImage)->Void)?
    var updatedHeight : (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setImage(_ urlString:String,options:HNMarkdownOption){
        self.urlString = urlString
        contentMode = .center
        isUserInteractionEnabled = true
        backgroundColor = options.bgImageView
        self.sd_setImage(with: URL(string: urlString),placeholderImage: options.placeholderImageView) { [weak self] image , error , cache, url  in
            self?.image = image
            self?.contentMode = .scaleAspectFit
            if let img = image , img.size.height > 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    self?.updateHeight(size: img.size)
                    self?.addTapable()
                }
            }
        }
    }
    func updateHeight(size:CGSize){
        let h = CGFloat(self.frame.width)  * (CGFloat(size.height)/CGFloat(size.width))
        self.snp.updateConstraints { make in
            make.height.equalTo(h)
        }
        self.updatedHeight?()
    }
    
    func addTapable(){
        let tap = UITapGestureRecognizer(target: self , action: #selector(self.tapOnImage))
        self.addGestureRecognizer(tap)
    }
    
    @objc func tapOnImage(){
        if let img = self.image {
            self.didTaped?(img)
        }
    }
}

