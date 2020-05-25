//
//  ViewController.swift
//  Mayusculas
//
//  Created by Paulina González Dávalos on 4/18/20.
//  Copyright © 2020 Paulina González Dávalos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, protocoloSettings {

    var arrDatos: NSArray!
    var nivel: Int = 1 // 1 = principiante,  2 = intermedio,  3 = avanzado
    var modalidad: Int = 1 // 1 = por letra,  2 = por certeza (VoF),  3 = completar
    var preguntas = Set<Int>()
    var reglas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "db", ofType: "plist")
        arrDatos = NSArray(contentsOfFile: path!)
        //item 0 - 32 : niv 0
        //item 33 - 65 : niv 1
        //item 66 - 84 : niv 2
    }
    
    func getPreguntas() -> Void {
        
        while preguntas.count < 10 {
            var value = 0
            if (nivel == 0) {
                value = Int.random(in: 0 ... 32)
            } else if (nivel == 1) {
                value = Int.random(in: 33 ... 65)
            } else {
                value = Int.random(in: 66 ... 84)
            }
            preguntas.insert(value)
        }
        print(preguntas)
        
        // Llenar arreglo de reglas a exportar
        for item in preguntas {
            let dic = arrDatos[item] as! NSDictionary
            reglas.append((dic["hint"] as? String)!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "niveles" {
            let vistaNiveles = segue.destination as! SettingsViewController
            vistaNiveles.delegado = self
        } else if segue.identifier == "modalidades" {
            let vistaMod = segue.destination as! SettingsViewController
            vistaMod.delegado = self
        } else if segue.identifier == "iniciar" {
            let vistaIniciar = segue.destination as! GameModeViewController
            getPreguntas()
            vistaIniciar.setPreguntas = preguntas
            vistaIniciar.nivel = nivel
            vistaIniciar.modalidad = modalidad
            vistaIniciar.arrDatos = arrDatos
            vistaIniciar.reglasExpotar = reglas
            print(reglas)
        }
    }
    
    
    @IBAction func aber(_ sender: Any) {
        print("nivel es ", nivel)
        print("modalidad es ", modalidad)
    }
    
    
    
    
    // MARK: - protocolos
    
    func cambiaNivel(n: Int) {
        nivel = n
    }
    
    func cambiaModalidad(m: Int) {
        modalidad = m
    }
    
}

