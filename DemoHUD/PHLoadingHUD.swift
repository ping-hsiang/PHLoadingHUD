//
//  PHLoadingHUD.swift
//  PHLoadingHUD
//
//  Created by eye on 2016/8/26.
//  Copyright © 2016年 Ping-Hsiang. All rights reserved.
//

import UIKit

public class PHLoadingHUD {
    
    /** Shared instance */
    static let sharedInstance = PHLoadingHUD()
    
    /** The main window that is used to display PHLoadingHUD */
    private let window:UIWindow!
    
    /** The previous window displayed */
    private var previousWindow:UIWindow?
    
    /** Configure default values for PHLoadingHUD */
    private init() {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor(white: 0, alpha: 0)
        vc.view.addSubview(ProgressHUD(frame: vc.view.bounds))
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = UIWindowLevelAlert
        window.rootViewController = vc
        window.alpha = 0
        
        previousWindow = UIWindow(frame: UIScreen.main.bounds)
        if let window = UIApplication.shared.delegate?.window {
            previousWindow = window
        }
    }
    
    /*HUD尺寸設置*/
    public static var size: CGFloat {
        get {
            return PHLoadingHUDConfig.sharedInstance.size
        }
        set {
            PHLoadingHUDConfig.sharedInstance.size = newValue
        }
    }
    
    /*HUD圓角設置*/
    public static var cornerRadius: CGFloat {
        get {
            return PHLoadingHUDConfig.sharedInstance.cornerRadius
        }
        set {
            PHLoadingHUDConfig.sharedInstance.cornerRadius = newValue
        }
    }
    
    //*HUD背景毛玻璃效果設置(extraLight、light、dark)*/
    public static var BlurEffectStyle: UIBlurEffectStyle {
        get {
            return PHLoadingHUDConfig.sharedInstance.BlurEffectStyle
        }
        set {
            PHLoadingHUDConfig.sharedInstance.BlurEffectStyle = newValue
        }
    }
    
    /*換圖片速度設置*/
    public static var ImageSpeed: Double {
        get {
            return PHLoadingHUDConfig.sharedInstance.ImageSpeed
        }
        set {
            PHLoadingHUDConfig.sharedInstance.ImageSpeed = newValue
        }
    }
    
    /*Imgae尺寸設置*/
    public static var ImageSize: CGFloat {
        get {
            return PHLoadingHUDConfig.sharedInstance.ImageSize
        }
        set {
            PHLoadingHUDConfig.sharedInstance.ImageSize = newValue
        }
    }
    
    
    /*帶入一系列依邊號命名的圖檔名*/
    public class func show(Name:String) {
        guard let previousWindow = UIApplication.shared.delegate?.window else {
            assert(false, "Couldn't find main window.")
            return
        }
        
        PHLoadingHUD.sharedInstance.previousWindow = previousWindow
        PHLoadingHUD.sharedInstance.window.makeKeyAndVisible()
        
        
        //ShowImage
        for view in PHLoadingHUD.sharedInstance.window.rootViewController!.view.subviews {
            //待解決 view.isKind(of: ProgressHUD())
            (view as! ProgressHUD).ImageShow(Name: Name)
        }
        
        //動畫 漸漸出現
        UIView.animate(withDuration: 0.35) {
            PHLoadingHUD.sharedInstance.window.alpha = 1
        }
    }
    
    /** HUD hide.*/
    public class func hide() {
        UIView.animate(withDuration: 0.35, animations: {
            PHLoadingHUD.sharedInstance.window.alpha = 0
        }) { (Bool) in
            PHLoadingHUD.sharedInstance.previousWindow?.makeKeyAndVisible()
        }
    }
    
}

/** The progressHUD class */
private class ProgressHUD: UIView {
    /** A required method. */
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    /** The hud view */
    var hudView:UIView!
    
    /** The hud Image */
    var hudImage:UIImageView!
    
    /** Init with a frame and setup th progressHUD with default values. */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let hudFrame = CGRect(x: 0, y: 0, width: PHLoadingHUDConfig.sharedInstance.size, height: PHLoadingHUDConfig.sharedInstance.size)
        let hudImgaeFrame = CGRect(x: 0, y: 0, width: PHLoadingHUDConfig.sharedInstance.ImageSize, height: PHLoadingHUDConfig.sharedInstance.ImageSize)
        
        hudView = UIView(frame: hudFrame)
        hudView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        hudView.layer.cornerRadius = PHLoadingHUDConfig.sharedInstance.cornerRadius
        hudView.clipsToBounds = true
        
        hudImage = UIImageView(frame: hudImgaeFrame)
        hudImage.center = CGPoint(x: hudView.frame.width/2, y: hudView.frame.height/2)
        
        
        let blurEffect = UIBlurEffect(style: PHLoadingHUDConfig.sharedInstance.BlurEffectStyle)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame.size = CGSize(width: hudView.frame.width, height: hudView.frame.height)
        hudView.addSubview(blurView)
        hudView.addSubview(hudImage)
        addSubview(hudView)
    }
    
    func ImageShow(Name:String){
        hudImage.contentMode = UIViewContentMode.scaleAspectFit
        hudImage.image = UIImage.animatedImageNamed(Name, duration: PHLoadingHUDConfig.sharedInstance.ImageSpeed)
    }
}

/** Configuring the PHLoadingHUD */
private class PHLoadingHUDConfig {
    /** HUD 大小. */
    var size: CGFloat = 100
    
    /** HUD 圓角. */
    var cornerRadius: CGFloat = 15
    
    /** 毛玻璃選項 ExtraLight/Light/Dark */
    var BlurEffectStyle:UIBlurEffectStyle = .dark
    
    /** 動畫圖片檔名 */
    var ImageName:String = "test"
    
    /** 動畫圖片速度 */
    var ImageSpeed:Double = 1.0
    
    /** 動畫圖片大小 */
    var ImageSize:CGFloat = 90
    
    /** Shared instance for PHLoadingHUD. */
    static let sharedInstance = PHLoadingHUDConfig()
}
