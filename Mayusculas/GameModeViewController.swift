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
    @IBOutlet weak var lbPregunta: UILabel!
    @IBOutlet weak var buttonIzquierdo: UIButton!
    @IBOutlet weak var buttonDerecho: UIButton!
    @IBOutlet weak var tfCompletar: UITextField!
    @IBOutlet weak var btnInfo: UIButton!
    
    @IBOutlet weak var lbPuntos: UILabel!
    
    
    var modalidad : Int!
    var nivel : Int!
    var puntos : Int! = 0
    var arrDatos : NSArray!

    var identificador : String!
    
    var correctoVF : Bool!
    
    override func viewDidLoad() {
       super.viewDidLoad()
        let dic = arrDatos[0] as! NSDictionary
        scModalidades.selectedSegmentIndex = modalidad - 1
        
        viewPreguntas.isHidden = false
        
        if modalidad == 1 || modalidad == 2 {
        viewBotones.isHidden = false
        viewCampo.isHidden = true
        if modalidad == 1 {
            lbPregunta.text = dic["textPorLetra"] as? String
            let lowerCased = dic["letraAPoner"] as? String
            buttonIzquierdo.setTitle(lowerCased, for: .normal)
            buttonDerecho.setTitle(lowerCased?.capitalized, for: .normal)
        } else {
            certeza(dic: dic)
        }
       } else {
        viewCampo.isHidden = false
        viewBotones.isHidden = true
        lbPregunta.text = dic["textoPorPalabra"] as? String
       }

       title = "Nivel " + String(nivel)

       // Do any additional setup after loading the view.
        
    }
    
    func certeza(dic: NSDictionary) {
        buttonIzquierdo.setTitle("Verdadero", for: .normal)
        buttonDerecho.setTitle("Falso", for: .normal)
        if Int.random(in: 0 ... 1) == 0 {
            lbPregunta.text = dic["textoCompletoMin"] as! String
            if dic["respuesta"] as! String == "min" {
                correctoVF = true

            } else {
                correctoVF = false
            }
        } else {
            lbPregunta.text = dic["textoCompletoMay"] as! String
            if dic["respuesta"] as! String == "may" {
                correctoVF = true
            } else {
                correctoVF = false
            }
        }
    }
    
    @IBAction func tapBotonIzquierdo(_ sender: Any) {
        if modalidad == 2 {
            if (correctoVF!) {
                retroRespuesta(flag : true)
            } else {
                retroRespuesta(flag : false)
            }
        }
    }
    
    @IBAction func tapBotonDerecho(_ sender: Any) {
        if modalidad == 2 {
            if (correctoVF!) {
                retroRespuesta(flag : false)

            } else {
                retroRespuesta(flag : true)
            }
        }
    }
    
    /*
        fraseCompletada
        Evalúa la respuesta de la modalidad de completar
     */
    @IBAction func fraseCompletada(_ sender: UIButton) {
        let respuesta = tfCompletar.text
        let dic = arrDatos[0] as! NSDictionary
        var isCorrect : Bool!
    
        if (respuesta == dic["resCompletar"] as? String) {
            isCorrect = true
        }
        else {
            isCorrect = false
        }
        retroRespuesta(flag : isCorrect)
    }
    
    /*
        retroRespuesta
        Despliega una alerta para indicar si la respuesta es
        correcta o incorrecta
     */
    func retroRespuesta(flag : Bool) {
        if (flag) {
            let alert = UIAlertController(title: "¡Correcto!",
                                          message: "Excelente ortografía",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            puntos += 10;
            lbPuntos.text = "Puntos:" + String(puntos)
        }
        else {
            let alert = UIAlertController(title: "¡Incorrecto!",
                                          message: "Intenta de nuevo",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            puntos -= 10;
            lbPuntos.text = "Puntos:" + String(puntos)
        }
        
    }
    
    @IBAction func mostrarHint(_ sender: UIButton) {
        let dic = arrDatos[0] as! NSDictionary
        let hint = dic["hint"] as? String
        let alert = UIAlertController(title: "Información", message: hint, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
       @IBAction func cambioModalidad(_ sender: UISegmentedControl) {
        let dic = arrDatos[0] as! NSDictionary

           if scModalidades.selectedSegmentIndex == 0 {
               modalidad = 1
               viewCampo.isHidden = true
               viewBotones.isHidden = false
               lbPregunta.text = dic["textPorLetra"] as? String
               let lowerCased = dic["letraAPoner"] as? String
               buttonIzquierdo.setTitle(lowerCased, for: .normal)
               buttonDerecho.setTitle(lowerCased?.capitalized, for: .normal)
           } else if scModalidades.selectedSegmentIndex == 1 {
               modalidad = 2
               viewCampo.isHidden = true
               viewBotones.isHidden = false
               certeza(dic: dic)
           } else {
               modalidad = 3
               lbPregunta.text = dic["textoPorPalabra"] as? String
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
