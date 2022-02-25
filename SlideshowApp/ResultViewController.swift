//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 太田喬也 on 2022/02/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var bigImage: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigImage.image = image
    }
}
