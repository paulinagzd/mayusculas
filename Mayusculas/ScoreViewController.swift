//
//  ScoreViewController.swift
//  Mayusculas
//
//  Created by Paulina González Dávalos on 5/9/20.
//  Copyright © 2020 Paulina González Dávalos. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var lbPuntaje: UILabel!
    @IBOutlet weak var h1: UIImageView!
    @IBOutlet weak var h2: UIImageView!
    @IBOutlet weak var h3: UIImageView!
    @IBOutlet weak var h4: UIImageView!
    @IBOutlet weak var h5: UIImageView!
    
    var puntos : Int!
    var reglas = [String]()
    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController!.interactivePopGestureRecognizer!.isEnabled = false;
        lbPuntaje.text = String(puntos!) + " " + "puntos"
        super.viewDidLoad()
        
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
    
    @IBAction func returnMenu(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func sendEmail(_ sender: Any) {
            let share = "¡Felicidades! Obtuviste \(String(puntos)) puntos en el juego de Mayúsculas"
            // se puede compartir texto, imagenes, url
            let activityViewController = UIActivityViewController(activityItems: [share], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func sendRules(_ sender: Any) {
        var text = "Reglas ortográficas vistas en el ejercicio: \n\n"
        var i = 0
        for rule in reglas {
            i += 1
            text += ("\(i). \(rule)" + "\n")
        }
        let share = [text]
        let activityViewController = UIActivityViewController(activityItems: share, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }

}
