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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbPuntaje.text = String(puntos!) + "puntos"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendEmail(_ sender: Any) {
        showMailComposer()
    }
    
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["address@example.com"])
        mailComposerVC.setSubject("Puntaje Mayúsculas")
        mailComposerVC.setMessageBody("¡Felicidades! Obtuviste \(String(puntos)) puntos en el juego de mayúsculas", isHTML: false)
        // self.present(mailComposerVC, animated: true, completion: nil)

        present(mailComposerVC, animated: true)
    }
    
       // MARK: - Navigation

       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
        if segue.identifier == "mainMenu" {
            _ = segue.destination as! ViewController
        }
            
       }
    

}
    
    extension ViewController: MFMailComposeViewControllerDelegate {
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        @unknown default:
            break
        }
        
        controller.dismiss(animated: true)
    }
}

