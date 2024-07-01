//
//  File.swift
//  
//
//  Created by TrungOW on 28/6/24.
//

import Foundation
import UIKit

class HNScrollTableView : UIScrollView {
    var options : HNMarkdownOption!
    var item : HNMarkDownItem!
    
    var widthOfColumn : CGFloat = 0
    var numberOfColumn : Int = 0
    var didAdded : ((_ height:CGFloat)->Void)?
    
    var stackView : UIStackView = UIStackView()
    
    init(options: HNMarkdownOption, item: HNMarkDownItem) {
        super.init(frame: .zero)
        self.options = options
        self.item = item
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SETUP
    func setUp(){
        self.backgroundColor = options.colorBorderTable
        self.contentInsetAdjustmentBehavior = .never
        self.bounces = false
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fill
        stackView.layer.borderColor = options.colorBorderTable.cgColor
        stackView.layer.borderWidth = 1
        
        self.addSubview(self.stackView)
        self.addHeader()
    }
    func addHeader(){
        if let cells = item?.head?.cells {
            let map = Array(cells.map{$0.plainText})
            self.numberOfColumn =  map.count
            if map.count < 3 {
                self.widthOfColumn = (self.options.widthContentView - 32) / CGFloat(map.count)
            }else{
                self.widthOfColumn = self.options.widthContentView / CGFloat(3)
            }
            
            let row = HNTableViewCell(options: self.options)
            row.addColumn(cells: map,isHeader: true,rowIndex: 0,widthOfColumn: widthOfColumn)
            self.stackView.addArrangedSubview(row)
        }
        addRow()
    }
    func addRow(){
        if let rows = item?.body?.rows {
            var h = CGFloat(0)
            for (index,row) in rows.enumerated() {
                let cell = HNTableViewCell(options: self.options)
                cell.addColumn(cells: row.cells.map{$0.plainText},isHeader: false,rowIndex: index,widthOfColumn: self.widthOfColumn)
                self.stackView.addArrangedSubview(cell)
                if cell.heightRow < self.options.minHeightOfTableCell {
                    h += self.options.minHeightOfTableCell
                }else{
                    h += cell.heightRow
                }
            }
            
            DispatchQueue.main.async {
                let w = self.widthOfColumn * CGFloat(self.numberOfColumn)
                
                self.stackView.frame = CGRect(x: 0, y: 0, width: w, height: h)
                
                self.contentSize = CGSize(width: w , height: h)
                self.didAdded?(h)
            }
        }
    }

    //MARK: - LAYOUT
    
    //MARK: - FUNC
    
    //MARK: - ACTION
}
