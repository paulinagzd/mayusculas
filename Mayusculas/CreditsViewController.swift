//
//  CreditsViewController.swift
//  Mayusculas
//
//  Created by Paulina González Dávalos on 5/25/20.
//  Copyright © 2020 Paulina González Dávalos. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {
    @IBOutlet weak var h1: UIImageView!
    @IBOutlet weak var h2: UIImageView!
    @IBOutlet weak var h3: UIImageView!
    @IBOutlet weak var h4: UIImageView!
    @IBOutlet weak var h5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Esconde las imágenes para pantallas pequeñas
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        if screenWidth <= 320 && screenHeight <= 568 {
            h1.isHidden = true
            h2.isHidden = true
            h3.isHidden = true
            h4.isHidden = true
            h5.isHidden = true
        } else {
            h1.isHidden = false
            h2.isHidden = false
            h3.isHidden = false
            h4.isHidden = false
            h5.isHidden = false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
