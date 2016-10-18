//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Sung, Alexander on 10/14/16.
//  Copyright © 2016 Capital One. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var explorePopUp: UIImageView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        searchViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController")
        accountViewController = storyboard.instantiateViewController(withIdentifier: "AccountViewController")
        trendingViewController = storyboard.instantiateViewController(withIdentifier: "TrendingViewController")

        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
        
        UIView.animate(withDuration:0.8, delay: 0.0,
                       options: [.autoreverse,.repeat], animations: { () -> Void in
                        self.explorePopUp.transform = CGAffineTransform(translationX: 0, y: 10)
            }, completion: nil)
    
    }
    
    @IBAction func didPressTab(_ sender: UIButton) {
        if (selectedIndex == 1) {
            UIView.animate(withDuration:0.8, delay: 0.0,
                           options:[], animations: { () -> Void in
                            self.explorePopUp.alpha = 0
                }, completion: nil)
        }
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
