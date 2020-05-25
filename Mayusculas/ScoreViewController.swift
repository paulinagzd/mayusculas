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
    
    var puntos : Int!
    var reglas = [String]()
    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController!.interactivePopGestureRecognizer!.isEnabled = false;
        print(reglas)
        lbPuntaje.text = String(puntos!) + " " + "puntos"
        print(puntos)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
