//
//  File.swift
//  
//
//  Created by TrungOW on 26/6/24.
//

import Foundation
import UIKit
import Markdown

//class HNBlockTableView : UIStackView {
//    
//    var item : HNMarkDownItem!
//    var options : HNMarkdownOption!
//    
//    init(item: HNMarkDownItem, options: HNMarkdownOption) {
//        super.init(frame: .zero)
//        self.item = item
//        self.options = options
//        self.axis = .vertical
//        self.spacing = 1
//        self.distribution = .fillEqually
//        self.backgroundColor = options.colorBorderTable
//        self.layer.borderColor = options.colorBorderTable.cgColor
//        self.layer.borderWidth = 1
//    }
//    
//    required init(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    //MARK: - SETUP
//    func setUp(){
//        addHeader()
//    }
//    
//    //MARK: - LAYOUT
//    func addHeader(){
//        if let cells = item?.head?.cells {
//            let row = HNTableViewCell(options: self.options)
//            row.addColumn(cells: cells.map{$0.plainText},isHeader: true,rowIndex: 0,widthOfColumn: 0)
//            self.addArrangedSubview(row)
//        }
//        addRow()
//    }
//    func addRow(){
//        if let rows = item?.body?.rows {
//            for (index,row) in rows.enumerated() {
//                let cell = HNTableViewCell(options: self.options)
//                cell.addColumn(cells: row.cells.map{$0.plainText},isHeader: false,rowIndex: index,widthOfColumn: 0)
//                self.addArrangedSubview(cell)
//            }
//        }
//    }
//    
//    //MARK: - FUNC
//
//    
//    //MARK: - ACTION
//    
//}
class HNTableViewCell : UIStackView {
    var options : HNMarkdownOption!
    var heightRow : CGFloat = 0
    
    init(options: HNMarkdownOption) {
        super.init(frame: .zero)
        self.options = options
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addColumn(cells:[String],isHeader:Bool,rowIndex:Int,widthOfColumn:CGFloat){
        self.axis = .horizontal
        self.spacing = 1
        self.distribution = .fillEqually
        for (index,cell) in cells.enumerated() {
            let lb = self.createLabel(string: cell,index:rowIndex,isHeader: isHeader,widthOfColumn: widthOfColumn)
            if isHeader {
                lb.font = options.fontBold
            }else{
                lb.font = options.font
            }
            self.addArrangedSubview(lb)
            if index == 0 {
                heightRow = lb.frame.height
            }else{
                if lb.frame.height > heightRow {
                    heightRow = lb.frame.height
                }
            }
        }
    }
    func createLabel(string:String,index:Int,isHeader:Bool,widthOfColumn:CGFloat)->UILabel{
        let lb = UILabel(frame: CGRect(x: 0, y: 0, width: widthOfColumn, height: 0))
        lb.font = options.font
        lb.textColor = options.colorText
        lb.text = string
        lb.textAlignment = options.tableTextAlignment
        lb.numberOfLines = 0
        if index % 2 == 0 , !isHeader{
            lb.backgroundColor = options.codeBackground.withAlphaComponent(0.8)
        }else{
            lb.backgroundColor = options.codeBackground
        }
        lb.sizeToFit()

        return lb
    }
}
