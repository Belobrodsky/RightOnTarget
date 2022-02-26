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
    
    /*
    //MARK: Ленивое свойство
    
     создали специально  свойство, чтобы объект не погибал при вызове функции   dismiss, а оставался храниться в памяти, чтобы хоть одна ссылка на него указывала
     
     lazy -  ленивое, чтобы не засорять оперативную память, вдруг пользователь о программе вообще никогда не нажмет
     
     если бы данного свойства не было бы и все созадавалось бы в методе ШоуАбоут,
     то форма создавалаь бы каждый раз и мы видели бы в консоле
     loadView
     viewDidLoad
     viewWillApper
     viewDidAppear
     
     
     во вторых данный код не будет работать без слова лейзи, так как не создан акземпляр
     */
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    private func getSecondViewController() -> SecondViewController
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
        
        
    }
    ///when button pressed
    ///my test comments for git learning
    ///
    ///something new comment for git merge
    @IBAction func showAbout(_ sender: Any) {
        
        
        // все три варианта являются рабочими
        
        //self.present(secondViewController, animated: true, completion: nil)
        //self.show(secondViewController, sender: nil)
        self.show(secondViewController, sender: self)
    }
    
}

