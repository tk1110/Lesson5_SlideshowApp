//
//  ViewController.swift
//  SlideshowApp_new
//
//  Created by Takaaki Kameda on 2018/10/21.
//  Copyright © 2018年 takaaki.kameda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ImageArray = [UIImage(named: "pic1.jpg"), UIImage(named: "pic2.jpg"), UIImage(named: "pic3.jpg"), UIImage(named: "pic4.jpg"), UIImage(named: "pic5.jpg")]
    var ShowImageIndex: Int = 0
    var timer: Timer!
    let imageView = UIViewController()
    
    @IBOutlet weak var slidetable: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplyImage()
    }
    
    @objc func DisplyImage(){
        if ShowImageIndex > (ImageArray.count - 1) {
            ShowImageIndex = 0
        }else if ShowImageIndex < 0 {
            ShowImageIndex = (ImageArray.count - 1)
        }
        
        slidetable.image = ImageArray[ShowImageIndex]
        
    }
    
    @objc func NextImage(_ Image: Int) {
        ShowImageIndex += 1
        DisplyImage()
    }
    
    @IBAction func startstop(_ sender: Any) {
        if self.timer == nil{
            slidetable.image = ImageArray[ShowImageIndex]
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(NextImage(_:)), userInfo: nil, repeats: true)
        }else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    @IBAction func go(_ sender: Any) {
        if self.timer == nil{
            ShowImageIndex += 1
            DisplyImage()
        }
    }
    
    @IBAction func back(_ sender: Any) {
        if self.timer == nil{
            ShowImageIndex -= 1
            DisplyImage()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gazouUPViewController:GazouUPViewController = segue.destination as! GazouUPViewController
        gazouUPViewController.UpImageIndex = ShowImageIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

