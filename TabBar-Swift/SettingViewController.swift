//
//  SecondViewController.swift
//  TabBar-Swift
//
//  Created by Bharat Jadav on 04/12/14.
//  Copyright (c) 2014 Bharat Jadav. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clickFirst(sender:AnyObject)
    {
//        let objSecond = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as ViewController
//        
//        self.navigationController?.pushViewController(objSecond, animated: false)
        
        self.navigationController?.popToRootViewControllerAnimated(false)
    }
    
    @IBAction func clickThird(sender:AnyObject)
    {
        let objSecond = self.storyboard?.instantiateViewControllerWithIdentifier("HighscoreViewController") as HighscoreViewController
        
        self.navigationController?.pushViewController(objSecond, animated: false)
    }
    
    @IBAction func clickFourth(sender:AnyObject)
    {
        let objSecond = self.storyboard?.instantiateViewControllerWithIdentifier("AboutViewController") as AboutViewController
        
        self.navigationController?.pushViewController(objSecond, animated: false)
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}