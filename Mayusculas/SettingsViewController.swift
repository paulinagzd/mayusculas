//
//  SettingsViewController.swift
//  Mayusculas
//
//  Created by Roby Gonzalez on 19/04/20.
//  Copyright © 2020 Paulina González Dávalos. All rights reserved.
//

import UIKit

protocol protocoloSettings {
    func cambiaNivel(n : Int) -> Void
    func cambiaModalidad(m : Int) -> Void
}

class SettingsViewController: UIViewController {

    var delegado : protocoloSettings!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - metodos para cambio de nivel
    @IBAction func principiante(_ sender: Any) {
        delegado.cambiaNivel(n: 1)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func intermedio(_ sender: Any) {
        delegado.cambiaNivel(n: 2)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func avanzado(_ sender: Any) {
        delegado.cambiaNivel(n: 3)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - metodos para cambio de modalidad
    
    @IBAction func porLetra(_ sender: Any) {
        delegado.cambiaModalidad(m: 1)
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func porCerteza(_ sender: Any) {
        delegado.cambiaModalidad(m: 2)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func completar(_ sender: Any) {
        delegado.cambiaModalidad(m: 3)
        navigationController?.popViewController(animated: true)
    }
}

