//
//  GazouUPViewController.swift
//  SlideshowApp_new
//
//  Created by Takaaki Kameda on 2018/11/01.
//  Copyright © 2018年 takaaki.kameda. All rights reserved.
//

import UIKit

class GazouUPViewController: UIViewController {

    var UpImageArray = [UIImage(named: "pic1.jpg"), UIImage(named: "pic2.jpg"), UIImage(named: "pic3.jpg"), UIImage(named: "pic4.jpg"), UIImage(named: "pic5.jpg")]
    var UpImageIndex: Int = 0
    
    @IBOutlet weak var Uptable: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        UpDisplyImage()
    }
    
    @objc func UpDisplyImage(){
        Uptable.image = UpImageArray[UpImageIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController:ViewController = segue.destination as! ViewController
        viewController.ShowImageIndex = UpImageIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
