//
//  ViewController.swift
//  Mayusculas
//
//  Created by Paulina González Dávalos on 4/18/20.
//  Copyright © 2020 Paulina González Dávalos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, protocoloCambiarNivel {

    var arrDatos: NSArray!
    var nivel: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "db", ofType: "plist")
        arrDatos = NSArray(contentsOfFile: path!)
        //let dato = arrDatos[0] as! NSDictionary   -- tienes que guardar el dato que estas guardando en otra variables
        //lTest.text = dato["letraAPoner"] as? String asi accesas los valores, solo cambien lo que está dentro de las []
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "niveles" {
            let vistaNiveles = segue.destination as! SettingsViewController
            vistaNiveles.delegadoNiveles = self
        }
    }
    
    // MARK: - protocolos
    
    func cambiaNivel(n: Int) {
        nivel = n
    }
    
}

