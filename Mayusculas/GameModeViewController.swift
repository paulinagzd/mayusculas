//
//  GameModeViewController.swift
//  Mayusculas
//
//  Created by Paulina González Dávalos on 4/19/20.
//  Copyright © 2020 Paulina González Dávalos. All rights reserved.
//

import UIKit

class GameModeViewController: UIViewController {
    @IBOutlet weak var scModalidades: UISegmentedControl!
    @IBOutlet weak var viewPreguntas: UIView!
    @IBOutlet weak var viewBotones: UIView!
    @IBOutlet weak var viewCampo: UIView!
    @IBOutlet weak var buttonIzquierdo: UIButton!
    @IBOutlet weak var buttonDerecho: UIButton!
    @IBOutlet weak var tfCompletar: UITextField!
    
    @IBOutlet weak var lbPuntos: UILabel!
    
    
    var modalidad : Int!
    var nivel : Int!
    var puntos : Int!

    var identificador : String!
    
    override func viewDidLoad() {
       super.viewDidLoad()

       viewPreguntas.isHidden = false


       if modalidad == 1 || modalidad == 2 {
           viewBotones.isHidden = false
           viewCampo.isHidden = true
       } else {
           viewCampo.isHidden = false
           viewBotones.isHidden = true
       }

       scModalidades.selectedSegmentIndex = modalidad - 1
       title = "Nivel " + String(nivel)

       // Do any additional setup after loading the view.
        
    }

       @IBAction func cambioModalidad(_ sender: UISegmentedControl) {
           if scModalidades.selectedSegmentIndex == 0 {
               viewCampo.isHidden = true
               viewBotones.isHidden = false
           } else if scModalidades.selectedSegmentIndex == 1 {
               viewCampo.isHidden = true
               viewBotones.isHidden = false
           } else {
               viewBotones.isHidden = true
               viewCampo.isHidden = false
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
