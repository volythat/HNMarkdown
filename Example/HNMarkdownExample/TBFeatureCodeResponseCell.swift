//
//  TBFeatureCodeResponseCell.swift
//  GPTApp
//
//  Created by oneweek02 on 5/10/23.
//

import UIKit
import HNMarkdown

class TBFeatureCodeResponseCell: UITableViewCell {
    
    @IBOutlet weak var viewContainer : UIView!
    public var didSelectedLink : ((_ url:URL)->Void)?
    public var didSelectedImage : ((_ image:UIImage)->Void)?
    public var updatedHeight : (()->Void)?
    
    var viewContent : HNMarkdown? = nil
    var heightOfContent : CGFloat = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setUp(text:String){
        if viewContent == nil {
            self.viewContent = HNMarkdown(frame:.zero)
            self.viewContainer.addSubview(viewContent!)
            viewContent?.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            let width : CGFloat = UIScreen.main.bounds.width - 16
            let options = HNMarkdownOption(widthView: width)
            options.fontSize = 15
            options.fontName = "HelveticaNeue"
            options.padding = 8
            options.turnOnLatex = true
            
            self.viewContent?.options = options
        }
        self.viewContent?.setUp(markdownText: text,isDebug: true)
        self.viewContent?.didSelectedLink = {[weak self] url in
            self?.didSelectedLink?(url)
        }
        self.viewContent?.didSelectedImage = {[weak self] image in
            self?.didSelectedImage?(image)
        }
    }
}

