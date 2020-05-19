//
//  ScoreViewController.swift
//  Mayusculas
//
//  Created by Paulina González Dávalos on 5/9/20.
//  Copyright © 2020 Paulina González Dávalos. All rights reserved.
//

import UIKit
import MessageUI

class ScoreViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var lbPuntaje: UILabel!
    
    var puntos : Int!
    var reglas = [String]()
    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController!.interactivePopGestureRecognizer!.isEnabled = false;
        print(reglas)
        lbPuntaje.text = String(puntos!) + " " + "puntos"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnMenu(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        let mailComposeViewController = configureMailComposeViewController()
        
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configureMailComposeViewController() -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["paulinagdavalos@gmail.com"])
        mailComposeVC.setSubject("Puntaje Mayúsculas")
        mailComposeVC.setMessageBody("¡Felicidades! Obtuviste \(String(puntos)) puntos en el juego de mayúsculas", isHTML: false)
        
        return mailComposeVC
    }
    
    func showSendMailErrorAlert() {
        let alert = UIAlertController(title: "Error al mandar correo", message: "Verifique el correo ingresado o su dispositivo.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case MFMailComposeResult.cancelled:
            self.dismiss(animated: true, completion: nil)
        case MFMailComposeResult.failed:
            self.showSendMailErrorAlert()
            self.dismiss(animated: true, completion: nil)
        case MFMailComposeResult.sent:
            self.dismiss(animated: true, completion: nil)
        default:
            break
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
