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
            
            
        
    
        
        
        
    }
}

