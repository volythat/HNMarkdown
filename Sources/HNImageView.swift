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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setImage(_ urlString:String){
        self.urlString = urlString
        contentMode = .scaleAspectFit
        isUserInteractionEnabled = true
        self.sd_setImage(with: URL(string: urlString)) { image , error , cache, url  in
            self.image = image
            if let img = image {
                self.updateHeight(size: img.size)
                self.addTapable()
            }
        }
    }
    func updateHeight(size:CGSize){
        let h = self.frame.width  * (size.height/size.width)
        self.snp.updateConstraints { make in
            make.height.equalTo(h)
        }
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
extension UIView {

    var heightConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }

    var widthConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .width && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }

}
