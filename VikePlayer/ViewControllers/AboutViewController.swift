//
//  AboutViewController.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/8/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit
import MessageUI

class AboutViewController: UIViewController {
    
    private enum Defaults {
        static let sendButtonBorderWidth: CGFloat = 2.0
        static let sendButtonBorderColor = UIColor(hex: 0x307FF8)
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private var sendEmailButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserInterface()
    }
    
    // MARK: - IBActions
    
    @IBAction private func closeAction(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction private func sendFeedback(sender: UIButton) {
        
        if MFMailComposeViewController.canSendMail() {
            // TODO: add recipient email
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.mailComposeDelegate = self
            presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            handleMailError()
        }
    }
    
    // MARK: - Private Methods
    
    private func setUpUserInterface() {
        sendEmailButton.layer.borderColor = Defaults.sendButtonBorderColor.CGColor
        sendEmailButton.layer.borderWidth = Defaults.sendButtonBorderWidth
    }
    
    private func handleMailError() {
        let alertController = UIAlertController(title: "Could not send email", message: "Please, check you email configuration", preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}

extension AboutViewController: MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {

    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        // TODO: handle errors
        
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}

