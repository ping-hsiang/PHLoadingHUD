//
//  ViewController.swift
//  DemoHUD
//
//  Created by eye on 2016/9/1.
//  Copyright © 2016年 Ping-Hsiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*HUD尺寸設置*/
        //PHLoadingHUD.size = 100
        
        /*HUD圓角設置*/
        //PHLoadingHUD.cornerRadius = 15
        
        //*HUD背景毛玻璃效果設置(extraLight、light、dark)*/
        //PHLoadingHUD.BlurEffectStyle = .Dark
        
        /*換圖片速度設置*/
        //PHLoadingHUD.ImageSpeed = 1.0
        
        /*Imgae尺寸設置*/
        //PHLoadingHUD.ImageSize = 90
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SHOWHUD(_ sender: UIButton) {
        
        PHLoadingHUD.show(Name: "test")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            PHLoadingHUD.hide()
        }
        
    }
}




