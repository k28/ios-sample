//
//  ViewController.swift
//  UIDocumentInteractionController-sample
//
//  Created by K.Hatano on 2020/04/18.
//  Copyright © 2020 K.Hatano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var controller: UIDocumentInteractionController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTapButton(_ sender: UIButton) {
        showShareView(sender)
    }
    
    func showShareView(_ sender: UIView) {
        guard let image = UIImage(named: "start") else {
            print("画像ファイルを読み込めません")
            return
        }
        let data = image.pngData()
        
        // ファイル一時保存してNSURLを取得
        guard let url = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("tmp.png") else {
            print("URLを作成できません")
            return
        }
        try! data?.write(to: url, options: .atomic)

        // UIDocumentInteractionControllerはクラスインスタンスで保持しておく
        controller = UIDocumentInteractionController(url: url)

        if !(controller!.presentOpenInMenu(from: sender.frame, in: view, animated: true)) {
            print("ファイルに対応するアプリがありません")
        }
    }
}

