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
    
    var didLoaded : (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setImage(_ urlString:String){
        contentMode = .scaleAspectFit
        self.sd_setImage(with: URL(string: urlString)) { image , error , cache, url  in
            self.image = image
        }
    }
    func updateHeight(size:CGSize){
        let h = self.frame.width  * (size.height/size.width)
        self.snp.updateConstraints { make in
            make.height.equalTo(h)
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
