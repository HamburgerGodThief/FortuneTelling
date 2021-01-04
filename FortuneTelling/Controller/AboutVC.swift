//
//  AboutVC.swift
//  FortuneTelling
//
//  Created by Hamburger on 2020/12/21.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class AboutVC: UIViewController {
    
    @IBOutlet weak var appLogoImg: UIImageView! {
        
        didSet {
            
            appLogoImg.image = UIImage.asset(.AppLogo_36px)
            
            appLogoImg.layer.cornerRadius = 20
            
        }
        
    }
    
    @IBOutlet weak var facebookBtn: UIButton! {
        
        didSet {
            
            facebookBtn.backgroundColor = UIColor.assetColor(.MainColor)
            
            facebookBtn.layer.cornerRadius = facebookBtn.frame.size.height / 2
            
            facebookBtn.tintColor = .white
            
        }
        
    }
    
    @IBOutlet weak var emailBtn: UIButton! {
        
        didSet {
            
            emailBtn.backgroundColor = UIColor.assetColor(.MainColor)
            
            emailBtn.layer.cornerRadius = emailBtn.frame.size.height / 2
            
            emailBtn.tintColor = .white
            
        }
        
    }
    
    func navConfigure() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white ]
        
        navigationController?.navigationBar.barTintColor = UIColor.assetColor(.MainColor)
        
        navigationController?.navigationBar.barStyle = .black
        
        title = "關於"
        
    }
            
    func configureMailComposer() {
        
        let mailAddress: String = "sunpraiseofficial@gmail.com"
        
        let subject: String = "請輸入主旨"
        
        let body: String = "請輸入你想請教的事情"
        
        if MFMailComposeViewController.canSendMail() {
            
            let mailComposeVC = MFMailComposeViewController()
            
            mailComposeVC.mailComposeDelegate = self
                            
            mailComposeVC.setToRecipients([mailAddress])
            
            mailComposeVC.setSubject(subject)
            
            mailComposeVC.setMessageBody(body, isHTML: false)
            
            present(mailComposeVC, animated: true, completion: nil)
            
        } else if let emailUrl = createEmailUrl(toWho: mailAddress, subject: subject, body: body) {
            
            UIApplication.shared.open(emailUrl)
            
        }
        
    }
    
    private func createEmailUrl(toWho: String, subject: String, body: String) -> URL? {
        
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let gmailURL = URL(string: "googlegmail://co?to=\(toWho)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        
        let defaultURL = URL(string: "mailto:\(toWho)?subject=\(subjectEncoded)&body=\(bodyEncoded)")
        
        if let gmailURL = gmailURL, UIApplication.shared.canOpenURL(gmailURL) {
            
            return gmailURL
            
        } else {
            
            return defaultURL
            
        }
        
    }
    
    @IBAction func didTouchFBBtn(_ sender: Any) {
        
        let fbURLWeb: URL = URL(string: "https://www.facebook.com/%E6%A3%AE%E9%9C%88%E9%BD%8B%E4%B8%BB%E7%9A%84%E5%91%BD%E7%90%86%E7%A9%BA%E9%96%93-Lay-Sunpraises-Fortune-Telling-World-103363308097916/")!
                
        let fbURLID = URL(string: "fb://profile/103363308097916")
    
        if UIApplication.shared.canOpenURL(fbURLID!) {
            
            UIApplication.shared.open(fbURLID!)
            
        } else {
            
            UIApplication.shared.open(fbURLWeb)
            
        }
        
    }
    
    @IBAction func didTouchMailBtn(_ sender: Any) {
                
        configureMailComposer()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navConfigure()
        
    }
    
}

extension AboutVC: MFMailComposeViewControllerDelegate {

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

        dismiss(animated: true, completion: nil)

    }

}
