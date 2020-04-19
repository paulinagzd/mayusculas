//
//  SettingsViewController.swift
//  Mayusculas
//
//  Created by Roby Gonzalez on 19/04/20.
//  Copyright © 2020 Paulina González Dávalos. All rights reserved.
//

import UIKit

protocol protocoloCambiarNivel {
    func cambiaNivel(n : Int) -> Void
}

class SettingsViewController: UIViewController {

    var delegadoNiveles : protocoloCambiarNivel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func principiante(_ sender: Any) {
        delegadoNiveles.cambiaNivel(n: 1)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func intermedio(_ sender: Any) {
        delegadoNiveles.cambiaNivel(n: 2)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func avanzado(_ sender: Any) {
        delegadoNiveles.cambiaNivel(n: 3)
        navigationController?.popViewController(animated: true)
    }
    
}

