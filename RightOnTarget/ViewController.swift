//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Владимир Белобродский on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var UISlider: UISlider!

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    @IBOutlet weak var currentPointsLabel: UILabel!
    
    @IBOutlet weak var totalPointsLabel: UILabel!
    
    //  загаданное число
    var number:Int=0
    
// round
    var round:Int=1
    
     //сумма очков
    var points: Int=0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillApper")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
        
//
//       let versionLabel = UILabel(frame: CGRect(x: 20, y: 40, width: 200, height: 10))
//
//        //let versionLabel = UILabel()
//        versionLabel.text = "Версия 1.1"
//
//        self.view.addSubview(versionLabel)
//
    }
    
    
    

    @IBAction func checkNumber(_ sender: Any) {
     

            let numSlider = Int(self.slider.value.rounded())
            
            switch self.number {
            case numSlider:
                self.points+=50
            case 1...numSlider:
                self.points+=50-numSlider+self.number
            case numSlider...50:
                self.points+=50-self.number+numSlider
            default:
                self.points+=0
            }
            
            currentPointsLabel.text = String("Current:    \(numSlider)")
            totalPointsLabel.text = String("Total: \(self.points)")
            
            
            
            
        if self.round == 5
        {
            let alert = UIAlertController(title: "Игра окончена", message:  "Вы заработали \(self.points) очков", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Начать заново", style: UIAlertAction.Style.default,handler: nil))
            self.present(alert, animated: true) {
                //
            }
            
            self.round=1
            self.points=0
            
            self.slider.value = 25
            
        }
        else {self.round+=1}
        
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
        
        
        
        
        
        
        
    }//checkNumber
    
    

    ///when button pressed
    ///my test comments for git learnin
    ///my test comments for git learning
    ///
    ///something new comment for git merge
//    @IBAction func showAbout(_ sender: Any) {
//       let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")self.present(viewController, animated: true, completion: nil)
//    }
}

