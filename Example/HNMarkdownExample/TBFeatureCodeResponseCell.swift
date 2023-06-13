//
//  TBFeatureCodeResponseCell.swift
//  GPTApp
//
//  Created by oneweek02 on 5/10/23.
//

import UIKit
import HNMarkdown

class TBFeatureCodeResponseCell: UITableViewCell {
    
    @IBOutlet weak var viewContent : HNMarkdown!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(text:String){
        self.viewContent.setUp(markdownText: text,isDebug: true)
    }
}
