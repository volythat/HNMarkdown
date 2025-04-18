//
//  ViewController2.swift
//  HNMarkdownExample
//
//  Created by oneweek02 on 6/12/23.
//

import UIKit
import Markdown

class ViewController2: UIViewController {
    
    @IBOutlet weak var buttonNext : UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    
    @IBAction func selectedNextButton(_ sender:UIButton){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? UIViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

