//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 太田喬也 on 2022/02/22.
//

import UIKit

class ViewController: UIViewController {

    // outletの接続
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextImageBotton: UIButton!
    @IBOutlet weak var backImageBotton: UIButton!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0

    // スライドショーに使用するタイマーを宣言
    var timer: Timer!

    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "kimori")!,
        UIImage(named: "juptoru")!,
        UIImage(named: "jukain")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tapImageView(_ sender: Any) {
        
    }
    
    // 再生ボタンを押下した時の処理
    @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理（戻る・進むボタンは非活性）を実装
            
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            
            // 自動送りの間は、進むボタンと戻るボタンはタップ不可にする
            nextImageBotton.isEnabled = false
            backImageBotton.isEnabled = false

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
            
            // 自動送り終了時は、進むボタンと戻るボタンはタップ可にする
            nextImageBotton.isEnabled = true
            backImageBotton.isEnabled = true
        }
    }
    
    // 進むボタンを押下した時の処理
    @IBAction func nextImage(_ sender: Any) {
        changeImage()
    }
    
    // 戻るボタンを押下した時の処理
    @IBAction func backImage(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
        if nowIndex == 0 {
            nowIndex = 2
        } else {
            nowIndex -= 1
        }
        
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            let resultViewController: ResultViewController
                 = segue.destination as! ResultViewController

            resultViewController.image = imageArray[nowIndex]
        
        // 停止時の処理を実装
        // タイマーを停止する
        timer.invalidate()

        // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
        timer = nil
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

