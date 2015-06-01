//
//  ViewController.swift
//  TabBar-Swift
//
//  Created by Bharat Jadav on 04/12/14.
//  Copyright (c) 2014 Bharat Jadav. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    @IBOutlet weak var serchBar: UITextField!
    @IBOutlet var tblList: UITableView!
    
    var arrlist = NSMutableArray()
    var imglist = NSMutableArray()
    var descriptionList = NSMutableArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true;
        
        arrlist = ["First","Second","Third","Fourth"]
        imglist = ["correct.png", "incorrect_A.png", "incorrect_B.png", "incorrect_C.png"]
        descriptionList = ["Category Desc 1", "Category Desc 2", "Category Desc 4", "Category added As per client"]
    }

    @IBAction func clickSecond(sender:AnyObject)
    {
        let objSecond = self.storyboard?.instantiateViewControllerWithIdentifier("SettingViewController") as SettingViewController
        
        self.navigationController?.pushViewController(objSecond, animated: false)
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


    //MARK:- TableView Delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrlist.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:UITableViewCell = tblList.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        //cell.textLabel?.text = arrPdflist[indexPath.row]
        
        cell.imageView.image = UIImage(named: imglist[indexPath.row] as NSString)
        cell.textLabel.font = UIFont.systemFontOfSize(15)
        cell.textLabel.text = arrlist[indexPath.row] as NSString
        cell.detailTextLabel?.text = descriptionList[indexPath.row] as NSString
        cell.detailTextLabel?.font = UIFont.systemFontOfSize(7)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let objPDF = self.storyboard?.instantiateViewControllerWithIdentifier("QuestionVC") as QuestionViewController
        objPDF.selected = indexPath.row
        objPDF.strText = arrlist[indexPath.row] as NSString
        self.navigationController?.pushViewController(objPDF, animated: true)
    }
}

