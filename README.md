# PHLoadingHUD

####根據指定的圖片名來加載序列圖片並放進HUD，如動畫圖片有test1...test10只需 PHLoadingHUD.Show("test") 就可以show出圖片動畫的HUD。

###使用方法
        /* HUD尺寸設置 */
        PHLoadingHUD.size = 100
        
        /* HUD圓角設置 */
        PHLoadingHUD.cornerRadius = 15
        
        /* HUD背景毛玻璃效果設置(extraLight、light、dark) */
        PHLoadingHUD.BlurEffectStyle = .Dark
        
        /* 換圖片速度設置 */
        PHLoadingHUD.ImageSpeed = 1.0
        
        /* Imgae尺寸設置 */
        PHLoadingHUD.ImageSize = 90
              
        /* HUD Show 帶入一系列依邊號命名的圖檔名 */
        PHLoadingHUD.Show("test")
              
        /* HUD Hide */
        PHLoadingHUD.Hide()

 ![Demo01](https://github.com/ping-hsiang/PHLoadingHUD/blob/master/Demo01.png)
 ![Demo02](https://github.com/ping-hsiang/PHLoadingHUD/blob/master/Demo02.png)
