//
//  ViewController.swift
//  MailKomposer
//
//  Created by waheedCodes on 06/12/2022.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    // MARK: - Properties
    
    let messageViewCOntroller = MFMailComposeViewController()

    // MARK: - Object Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageViewCOntroller.mailComposeDelegate = self
    }
    
    // MARK: - Action
    
    @IBAction func sendAMessageDidTap(_ sender: UIButton) {
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
        } else {
            messageViewCOntroller.setToRecipients(["sampleemail@address.com"])
            messageViewCOntroller.setSubject("Mail Komposer")
            messageViewCOntroller.setMessageBody("Hello from Mail Komposer!", isHTML: false)
            self.present(messageViewCOntroller, animated: true)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true)
    }
}
