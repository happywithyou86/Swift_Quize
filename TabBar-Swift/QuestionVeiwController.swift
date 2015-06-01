//
//  FirstDetailVC.swift
//  TabBar-Swift
//
//  Created by Bharat Jadav on 04/12/14.
//  Copyright (c) 2014 Bharat Jadav. All rights reserved.
//

import Foundation
import UIKit


class QuestionViewController: UIViewController
{
    
    
    var selected = 0
    var strText = ""
    
    //Instance Variables
    var arrayOfQuestions = []
    var numberOfLives = 3
    var numberOfPoints = 0
    var currentQuestion = 0
    var questionCorrectAnswer = 1
    
    
    @IBOutlet var lblCategory: UILabel!
    @IBOutlet var lblPoints: UILabel!
    @IBOutlet var lblLives: UILabel!
    
    @IBOutlet var lblQuestion: UILabel!
    
    @IBOutlet var btnAnswerOne: UIButton!
    @IBOutlet var btnAnswerTwo: UIButton!
    @IBOutlet var btnAnswerThree: UIButton!
    @IBOutlet var btnAnswerFour: UIButton!
    
    @IBOutlet var btnNextQuestion: UIButton!
    
    @IBOutlet var btnStartOver: UIButton!
    
    @IBAction func AnswerOneButtonPressed(sender: UIButton) {
        
        answerCosmetics(checkAnswer(questionCorrectAnswer, answerNumber: 1), answerNumber: btnAnswerOne)
    }
    
    
    @IBAction func AnswerTwoButtonPressed(sender: UIButton) {
        answerCosmetics(checkAnswer(questionCorrectAnswer, answerNumber: 2), answerNumber: btnAnswerTwo)
    }
    
    @IBAction func AnswerThreeButtonPressed(sender: UIButton) {
        answerCosmetics(checkAnswer(questionCorrectAnswer, answerNumber: 3), answerNumber: btnAnswerThree)
    }
    
    @IBAction func AnswerFourButtonPressed(sender: UIButton) {
        answerCosmetics(checkAnswer(questionCorrectAnswer, answerNumber: 4), answerNumber: btnAnswerFour)
    }
    
    
    @IBAction func nextQuestionButtonPressed(sender: UIButton) {
        if(finishedQuestion(currentQuestion)==true) {
            
        }
        else {
            nextQuestion()
        }
    }
    
    
    @IBAction func startOverButtonPressed(sender: UIButton) {
        initialState()
    
    }
    
    override func viewDidLoad()
    {
        
        //Table Create
        let err = SD.createTable("Category", withColumnNamesAndTypes: ["Name":.StringVal, "Population":.IntVal])
        let err1 = SD.executeChange("insert into Category(Name, Population) values('Toronto', 234567)")
        
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
        
        
        super.viewDidLoad()
        
        self.title = "Main Details View"
        
        self.navigationController?.navigationBarHidden = false;
        
        lblCategory.text = strText
        
        NSLog("Text: %@", strText)
        
        //MARK: Questions
        let questionOne = question("What year did WWII start1?", answerOne:"1939", answerTwo:"1940", answerThree:"1941", answerFour:"1942", correctAnswer:1)
        let questionTwo = question("What year did WWII start2?", answerOne:"1939", answerTwo:"1940", answerThree:"1941", answerFour:"1942", correctAnswer:1)
        let questionThree = question("What year did WWII start3?", answerOne:"1939", answerTwo:"1940", answerThree:"1941", answerFour:"1942", correctAnswer:1)
        let questionFour = question("What year did WWII start4?", answerOne:"1939", answerTwo:"1940", answerThree:"1941", answerFour:"1942", correctAnswer:1)
        let questionFive = question("What year did WWII start5?", answerOne:"1939", answerTwo:"1940", answerThree:"1941", answerFour:"1942", correctAnswer:1)
        let questionSix = question("What year did WWII start6?", answerOne:"1939", answerTwo:"1940", answerThree:"1941", answerFour:"1942", correctAnswer:1)
        
        
        //Adding all the questions to the array
        arrayOfQuestions = [questionOne, questionTwo, questionThree, questionFour, questionFive, questionSix]
        
        initialState()

    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBarHidden = true;
    }
    
    
    
    
    
    //MARK: Adding Question Function
    
    func question(question:String, answerOne:String, answerTwo:String, answerThree:String, answerFour:String, correctAnswer:Int) -> NSArray {
        
        var quizQuestion = question;
        
        var firstAnswer = answerOne;
        var secondAnswer = answerTwo;
        var thirdAnswer = answerThree;
        var fourthAnswer = answerFour;
        
        var rightAnswer = correctAnswer;
        
        let questionAnswerArray = [question, firstAnswer, secondAnswer, thirdAnswer, fourthAnswer, rightAnswer];
        return questionAnswerArray;
        
    }
    
    func initialState() {
        numberOfLives=3
        numberOfPoints = 0
        currentQuestion = 0
        questionCorrectAnswer=1
        
        btnAnswerOne.hidden = false
        btnAnswerTwo.hidden = false
        btnAnswerThree.hidden = false
        btnAnswerFour.hidden = false
        
        var firstQuestion = arrayOfQuestions[currentQuestion]
        
        lblLives.text = "\(numberOfLives)"
        lblPoints.text = "\(numberOfPoints)"
        lblQuestion.text = "\(firstQuestion[0])"
      
        
        btnAnswerOne.setTitle("\(firstQuestion[1])", forState:UIControlState.Normal)
        btnAnswerTwo.setTitle("\(firstQuestion[2])", forState:UIControlState.Normal)
        btnAnswerThree.setTitle("\(firstQuestion[3])", forState:UIControlState.Normal)
        btnAnswerFour.setTitle("\(firstQuestion[4])", forState:UIControlState.Normal)
        
        //Hide the next questio button
        btnNextQuestion.hidden = true
        
        btnStartOver.hidden = true
        
    }
 
    func checkAnswer(correctAnswerIndex:Int, answerNumber:Int)->Bool {
        
        btnAnswerOne.hidden = true;
        btnAnswerTwo.hidden = true;
        btnAnswerThree.hidden = true;
        btnAnswerFour.hidden = true;
        
        btnNextQuestion.hidden = false
        
        if (correctAnswerIndex==answerNumber) {
            return true
        }
        else {
            return false
        }
        
    }
    
    func answerCosmetics(isItRight:Bool, answerNumber:UIButton) {
        
        if(isItRight==true) {
            answerNumber.hidden = false
            answerNumber.setTitle("Correct!", forState:UIControlState.Normal)
            numberOfPoints+=1
            lblPoints.text = "\(numberOfPoints)"
            
            
        }
        else {
            answerNumber.hidden = false
            answerNumber.setTitle ( "Wrong :(", forState: UIControlState.Normal)
            
            numberOfLives -= 1
            lblLives.text = "\(numberOfLives)"
            questionOver(numberOfLives)
            
        }
    }
    
    func nextQuestion() {
        
        currentQuestion += 1
        
        var newQuestion = arrayOfQuestions[currentQuestion]
        questionCorrectAnswer = newQuestion[5].integerValue
        
        btnAnswerOne.hidden = false
        btnAnswerTwo.hidden = false
        btnAnswerThree.hidden = false
        btnAnswerFour.hidden = false
        
        btnAnswerOne.setTitle("\(newQuestion[1])",  forState:UIControlState.Normal)
        btnAnswerTwo.setTitle("\(newQuestion[2])", forState: UIControlState.Normal)
        btnAnswerThree.setTitle("\(newQuestion[3])", forState: UIControlState.Normal)
        btnAnswerFour.setTitle("\(newQuestion[4])", forState: UIControlState.Normal)
        
        
        lblQuestion.text = "\(newQuestion[0])"
        
        btnNextQuestion.hidden = true
        
    }
   
    func questionOver(lives:Int) {
        
        if(lives<=0) {
            var alert = UIAlertController(title:"Question Over", message:"You lost all three lives:(", preferredStyle:UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title:"Start Again", style:UIAlertActionStyle.Default, handler:{action in
                self.initialState()
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            
        }
    }
    
    func finishedQuestion(currentQuestionNumber:Int)->Bool {
        if(currentQuestionNumber==arrayOfQuestions.count-1) {
            btnAnswerOne.hidden = true
            btnAnswerTwo.hidden = true
            btnAnswerThree.hidden = true
            btnAnswerFour.hidden = true
            
            //Change the question text to our score
            lblQuestion.text = "Congratulations, you finished with a score of \(numberOfPoints)/\(arrayOfQuestions.count)!"
            
            btnStartOver.hidden = false
            btnNextQuestion.hidden = true
            
            return true
        }
        else{
            return false
        }
        
    }
    
    
}



