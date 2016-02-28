//
//  NakamiViewController.swift
//  tebleViewTest
//
//  Created by Tsubasa NAKAJIMA on H28/02/10.
//  Copyright © 平成28年 yuki takei. All rights reserved.
//

import UIKit

class NakamiViewController: UIViewController {
    @IBOutlet var label:UILabel!
    var getTextmessage:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.text = getTextmessage
        label.numberOfLines = 3
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func back() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
