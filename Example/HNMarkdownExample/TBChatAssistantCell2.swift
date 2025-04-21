//
//  TBChatAssistantCell.swift
//  GPTApp
//
//  Created by TrungOW on 26/07/2023.
//

import UIKit
import HNMarkdown

class TBChatAssistantCell2: UITableViewCell {
    @IBOutlet weak var viewContent : UIView!
    @IBOutlet weak var containerMarkdown : UIView!
    @IBOutlet weak var viewButtons : UIView!
    
    @IBOutlet weak var heightOfButtons : NSLayoutConstraint!
    
    var viewMarkdown : HNMarkdown? = nil
    
    public var updatedHeight : (()->Void)?
    public var didTapUrl : ((URL)->Void)?
    public var didTapImage : ((UIImage)->Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(message:String,speaking:Bool){
        if viewMarkdown == nil {
            self.viewMarkdown = HNMarkdown(frame:.zero)
            self.containerMarkdown.addSubview(viewMarkdown!)
            viewMarkdown?.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            
        }
        let width : CGFloat = UIScreen.main.bounds.width - 16
        let options = HNMarkdownOption(widthView: width)
        options.fontSize = 15
        options.fontName = "HelveticaNeue"
        options.padding = 0
        options.turnOnLatex = true
        
        self.viewMarkdown?.options = options
        
        self.viewMarkdown?.updatedHeight = { [weak self] height in
            self?.updatedHeight?()
        }

        self.viewMarkdown?.didSelectedLink = { [weak self] url in
            self?.didTapUrl?(url)
        }
        self.viewMarkdown?.didSelectedImage = { [weak self] image in
            self?.didTapImage?(image)
        }
        self.viewMarkdown?.setUp(markdownText: message,isDebug: true)
        self.heightOfButtons.constant = 8
    }
    

}
