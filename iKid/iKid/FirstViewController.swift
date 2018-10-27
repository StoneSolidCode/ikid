//
//  FirstViewController.swift
//  ikid
//
//  Created by iguest on 10/26/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    fileprivate var firstViewController : GoodFirstViewController!
    fileprivate var secondViewController : GoodSecondViewController!
    
    fileprivate func firstBuilder() {
        if firstViewController == nil {
            firstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "GoodFirst")
                as! GoodFirstViewController
        }
    }
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "GoodSecond")
                as! GoodSecondViewController
        }
    }
    
    @IBAction func switchViews(_ sender: UIBarButtonItem) {
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(firstViewController, to: secondViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(secondViewController, to: firstViewController)
        }
        UIView.commitAnimations()
        
        
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstBuilder()
        switchViewController(nil, to: firstViewController)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

