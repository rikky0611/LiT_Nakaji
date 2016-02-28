//////
//////  ViewController.swift
//////  tebleViewTest
//////
//////  Created by yuki takei on 2015/12/07.
//////  Copyright © 2015年 yuki takei. All rights reserved.
//////
////


import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    //TableViewを宣言
    @IBOutlet weak var myTableView: UITableView!
    
    //ResultViewControllerに渡すための変数
    var selectedText:String!
    var selectedImage:UIImage!
    
    //テーブル用初期配列
    var imgArray: [UIImage] = []
    var myItems: [String] = ["プログラミングについて", "勉強のやり方について"]
    
    //NSUserDefaults取得
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像初期設定
        let img1 = UIImage(named: "1.png")
        let img2 = UIImage(named: "1x.png")
        
        imgArray.append(img1!)
        imgArray.append(img2!)
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        // Delegateを設定する.
        myTableView.delegate = self
        
        // ナビゲーションバー設定->storyBoard上で
        //self.navigationItem.title = "title"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //編集ボタンをタップされたとき
    @IBAction func editTapped(sender: AnyObject) {
        if editing {
            super.setEditing(false, animated: true)
            myTableView.setEditing(false, animated: true)
        } else {
            super.setEditing(true, animated: true)
            myTableView.setEditing(true, animated: true)
        }
    }
    //セル追加ボタンがタップされたとき
    @IBAction func addTapped(sender: AnyObject) {
        
        // myItemsに追加.
        myItems.append("new_title")
        
        // TableViewを再読み込み
        myTableView.reloadData()
    }
        
        
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    // セルの設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell:TableViewCell = tableView.dequeueReusableCellWithIdentifier("SampleCell", forIndexPath: indexPath) as! TableViewCell
        
        cell.cellLabel.text = "\(myItems[indexPath.row])"
        cell.cellImageView.image = imgArray[indexPath.row]
        cell.cellLabel.numberOfLines = 3
  
        return cell
    }
    
    //タップされたセル感知：遷移への準備
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named:"\(imgArray[indexPath.row])")
        selectedText = "\(myItems[indexPath.row])"
        
        //画像が選択されていれば遷移
        if selectedImage != nil {
            // resultViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toResultVC",sender: nil)
        }
    }
    
    
    // セルを削除しようとした場合
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 削除のとき.
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // 指定されたセルのオブジェクトと画像をmyItemsから削除する.
            myItems.removeAtIndex(indexPath.row)
            imgArray.removeAtIndex(indexPath.row)
            
            // TableViewを再読み込み.
            tableView.reloadData()
        }
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultVC") {
            let resultVC: ResultViewController = segue.destinationViewController  as! ResultViewController
            // SubViewController のselectedImgに選択された画像を設定する
            resultVC.getImage = selectedImage
            resultVC.getText = selectedText
        }
        
    }

}



