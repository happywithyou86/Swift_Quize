//
//  AppDelegate.swift
//  TabBar-Swift
//
//  Created by Bharat Jadav on 04/12/14.
//  Copyright (c) 2014 Bharat Jadav. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        
        // ----------------------------------------------------------------------------------
        // -Table Create, DATA Insert
        // ----------------------------------------------------------------------------------
        
        //** Category Table create and insert
        let err_category = SD.createTable("Category", withColumnNamesAndTypes: ["Category_id":.IntVal, "Category_No":.IntVal, "Quiz_Type":.StringVal, "Category_Icon":.StringVal, "Category_Name":.StringVal, "Category_Decription":.StringVal, "Points_per_question":.IntVal, "Number_of_Questions":.IntVal, "Seconds_per_Question":.IntVal, "Number_of_Choices":.IntVal])
        
        
        SD.executeChange("insert into Category values(1,1,'TB','icon.png','Textbox quiz-User will provide answer','Set of qiz will be generated from (Category_No1/Question Sheet) with 6 items(Number_of_Questions/Category Sheet',1,6,15,0)")
        SD.executeChange("insert into Category values(2,1,'MC_A','icon.png','Multiple Choice Quiz - A','Choices will be from:\n Correct+Incorrect_optA/Incorrect_optB/Incorret_optA',1,7,15,0)")
        SD.executeChange("insert into Category values(3,1,'MC_B','icon.png','Multiple Choice Quiz -B','Choices will be from:\n Correct+other correct answers(random, based from Number_of_Choices/CategorySheet) \n Example:If correct answer is Tuesday, \n the choices are Tuesday + Monday/Friday/Sunday(random)',1,8,15,4)")
        SD.executeChange("insert into Category values(4,2,'TB','icon.png','Textbox quiz - User will provide answer','Set of quiz will be generated from (Category_No2/Question Sheet) with 6 items(Number_of_Questions/CategorySheet',1,10,15)")
        SD.executeChange("insert into Category values(5,2,'MC_B','icon.png','Multiple Choice Quiz - B','Choices will be from: \n Correct + other correct answers(random, based from Number_of_Choices/Category Sheet',1,8,15,4)")
        
        //SD.executeChange("insert into Category(Category_id, Category_No, Quiz_Type, Category_Icon, Category_Name, Category_Decription, Points_per_question, Number_of_Questions, Seconds_per_Question, Number_of_Choices) values('','','','','','','','','','','','','','','','','')")
        //SD.executeChange("insert into Category values(1,1,'','','','','','','','','')")
        
        //** Question Table create and insert
        let err_question = SD.createTable("Question", withColumnNamesAndTypes: ["Q_id":.IntVal, "Category_No":.IntVal, "Question":.StringVal, "Correct_Answer":.StringVal, "Incorrect_optA":.StringVal, "Incorrect_optB":.StringVal, "Incorrect_optC":.StringVal, "Q_multimedia":.StringVal, "Q_info":.StringVal, "Q_explanation":.StringVal, "Q_image":.StringVal])
        
        
        SD.executeChange("insert into Question values(1,1,'What is the 1st day of the week?','Monday','','','','question.wav','This is a clue 1','','Q_explanation_image.png')")
        SD.executeChange("insert into Question values(2,1,'What is the 2st day of the week?','Tuesday','','','','question.png','This is an info 2','Explanation 2','Q_explanation_image.png')")
        SD.executeChange("insert into Question values(3,1,'What is the 3st day of the week?','Wednesday','','','','question.mp4','This is image credit 3','','Q_explanation_image.png')")
        SD.executeChange("insert into Question values(4,1,'What is the 4st day of the week?','Thursday','','','','','Greeting 4','Explanation 4','Q_explanation_image.png')")
        SD.executeChange("insert into Question values(5,1,'What is the 5st day of the week?','Friday','','','','','','','Q_explanation_image.png')")
        SD.executeChange("insert into Question values(6,1,'What is the 6st day of the week?','Saturday','','','','question.wav','This is a clue 6','Explanation 6','Q_explanation_image.png')")
        SD.executeChange("insert into Question values(7,1,'What is the 7st day of the week?','Sunday','','','','question.png','This is an info 2','','Q_explanation_image.png')")
        
        
        ///---------------------------- Table insert End -----------------------------------
        
        
        
        let(resultSet, err2) = SD.executeQuery("select * from Category where name = ?", withArgs:["Toronto"])
        if(err2 != nil){
            
        }
        else {
            for row in resultSet{
                if let name=row["Name"]?.asString() {
                    println("The City name is: \(name)")
                }
            }
            
        }

        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

