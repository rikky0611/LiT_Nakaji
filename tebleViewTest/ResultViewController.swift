//
//  ResultViewController.swift
//  tebleViewTest
//
//  Created by yuki takei on 2016/01/12.
//  Copyright © 2016年 yuki takei. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var myTableView: UITableView!
    var my2ItemsArray: [String] = []
    
    @IBOutlet var textField: UITextField!
    
    var selectedText2:String!
    var selectedImage2:UIImage!
    
    let imgArray: NSArray = []
    
    var getImage:UIImage!
    var getText:String!
    var getTextmessage:String!
    
    var originalimage : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()


        label.text = getText
    
        mainImageView.image = getImage
        // Do any additional setup after loading the view.
        
        //nanna
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        label.textColor = UIColor.blueColor()
        
        textField.delegate = self

        self.myTableView.estimatedRowHeight = 90
        self.myTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(my2ItemsArray.count)
        return my2ItemsArray.count
    }
    
    // セルの設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell:TableViewCell2 = myTableView.dequeueReusableCellWithIdentifier("SampleCell2", forIndexPath: indexPath) as! TableViewCell2
        
        cell.cellLabel.text = "\(my2ItemsArray[indexPath.row])"
        return cell
    }
    
    //タップされたセル感知：遷移への準備
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
        
        selectedImage2 = UIImage(named:"\(imgArray[indexPath.row])")
        selectedText2 = "\(my2ItemsArray[indexPath.row])"
        
        if selectedImage2 != nil {
            // resultViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toResultVC2",sender: nil)
        }
        
    }
    
    
    @IBAction func moji() {
        if textField.text != "" {
            //self.myTableView.reloadData()
            my2ItemsArray.append(textField.text!)
            print("\(my2ItemsArray)")
            self.myTableView.reloadData()
            textField.text = ""
            textField.placeholder = "メッセージ"
        } else {
            textField.placeholder = "文字を記入してください"
        }
        
        
        /////
        
        selectedText2 = getTextmessage
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func back() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultVC2") {
            let resultVC2: NakamiViewController = segue.destinationViewController  as! NakamiViewController
            // SubViewController のselectedImgに選択された画像を設定する
            resultVC2.getTextmessage = selectedText2
            NSLog("\(selectedText2) was sent to Nakami" )
        }
        
    }

    
    
    
}
