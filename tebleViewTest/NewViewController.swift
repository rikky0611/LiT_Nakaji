//
//  NewViewController.swift
//  tebleViewTest
//
//  Created by Tsubasa NAKAJIMA on H28/02/03.
//  Copyright © 平成28年 yuki takei. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var mainImageView: UIImageView!
    var originalimage : UIImage!
    @IBOutlet var textField: UITextField!
    var selectedText3:String!
    var selectedImage3:UIImage!
    var getImage3:UIImage!
    var getText3:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    @IBAction func back() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func openAlbum(){
        //カメラロールが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            //カメラを自由な形に開きたいとき(今回は正方形)
            picker.allowsEditing = true
            
            //アプリ画面に戻る
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        mainImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        //撮った写真を最初の画像として記憶しておく
        originalimage = mainImageView.image
        
        dismissViewControllerAnimated(true, completion: nil)  //アプリ画面へ戻る
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    @IBAction func tasu() {
        if textField.text != "" {
            //self.myTableView.reloadData()
            textField.placeholder = "タイトル"
            
            func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
                if (segue.identifier == "toResultVC") {
                    let resultVC: ViewController = segue.destinationViewController  as! ViewController
                    // SubViewController のselectedImgに選択された画像を設定する
                    resultVC.getImage = selectedImage3
                    resultVC.getText = selectedText3
                }
                
            }

        } else {
            textField.placeholder = "タイトルを記入してください"
            
        }
     
    }


    
    
    
    
}
