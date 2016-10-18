//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Sung, Alexander on 10/14/16.
//  Copyright © 2016 Capital One. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var textButton: UIImageView!
    @IBOutlet weak var photoButton: UIImageView!
    @IBOutlet weak var quoteButton: UIImageView!
    @IBOutlet weak var linkButton: UIImageView!
    @IBOutlet weak var chatButton: UIImageView!
    @IBOutlet weak var videoButton: UIImageView!
    
    
    @IBOutlet var buttonsForAnimation: Array<UIImageView>!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        for button in buttonsForAnimation! {
            button.center.y = button.center.y + 600 + CGFloat(button.tag * 100)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        for button in self.buttonsForAnimation {
            UIView.animate(withDuration:0.8, delay: TimeInterval(button.tag) * 0.1, options:[] ,
                           animations: { () -> Void in
                            button.center.y = button.center.y - 600 -  CGFloat(button.tag * 100)
                }, completion:nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nevermindButtonTapped(_ sender: AnyObject) {
        for button in self.buttonsForAnimation {
            UIView.animate(withDuration:0.8, delay: TimeInterval(button.tag) * 0.1, options:[] ,
                           animations: { () -> Void in
                            button.center.y = button.center.y - 1200 - CGFloat(button.tag * 100)
                }, completion:{(Bool)  in
                    self.dismiss(animated: true, completion: nil)
            })
        }
        
    }


}
