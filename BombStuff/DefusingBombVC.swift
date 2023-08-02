//
//  DefusingBombVC.swift
//  BombStuff
//
//  Created by DPI Student 047 on 7/20/23.
//

import UIKit

class DefusingBombVC: UIViewController {
    
    var tbool: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
    }
    
    //there's a timer
    var secs = 30
    var timer: Timer? = nil
    
    
    func runTimer() {
        if (zInputs != zCorrects) || !checkDates() {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
            timerLabel.text = ("\(secs) secs left")
        }
    }
    
    @objc func fire() {
        if secs > 0 {
            secs -= 1
            if secs > 5 {
                timerLabel.text = ("\(secs) secs left")
            }
            else {
                timerLabel.text = "HURRY UP SLOWPOKE"
            }
                               
        }
        else if tbool == true {
            secs = 100000
            timer!.invalidate()
            performSegue(withIdentifier: "defuseLose", sender: nil)
        }
    }
    
    
    
    //Buttons
    
    @IBOutlet var aries: UIButton!
    @IBOutlet var taurus: UIButton!
    @IBOutlet var aquarius: UIButton!
    @IBOutlet var pisces: UIButton!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var defuseButton: UIButton!
    
    @IBOutlet var aquariusDater: UIDatePicker!
    @IBOutlet var piscesDater: UIDatePicker!
    @IBOutlet var ariesDater: UIDatePicker!
    @IBOutlet var taurusDater: UIDatePicker!
    
    
    @IBOutlet var cAquariusDate: UIDatePicker!
    @IBOutlet var cPiscesDate: UIDatePicker!
    @IBOutlet var cAriesDate: UIDatePicker!
    @IBOutlet var cTaurusDate: UIDatePicker!
    

    @IBOutlet var timerLabel: UILabel!
    
    //create empty array
    var zInputs: [String] = []
    //create correctanswer array
    var zCorrects: [String] = ["Aquarius", "Pisces", "Aries", "Taurus"]
    //when zbutton is pressed, disable button
    //when zbutton is pressed, add their text to the list
    
    @IBAction func pressZButton(_ sender: UIButton) {
        zInputs.append(sender.configuration!.title!)
        sender.isEnabled = false
        print(zInputs)
    }
    
    //when reset button is pressed, clear array and reactivate buttons
    
    @IBAction func resetZButtons(_ sender: UIButton) {
        zInputs = []
        aries.isEnabled = true
        taurus.isEnabled = true
        aquarius.isEnabled = true
        pisces.isEnabled = true
        print(zInputs)
    }
    
    
    //when defuse button is pressed, check if inputarray = correctanswer arra
    //and if all dates are correct (do later)
    
    
    func checkDates() -> Bool {
        if (aquariusDater.date.formatted() == cAquariusDate.date.formatted()) && (piscesDater.date.formatted() == cPiscesDate.date.formatted()) && (ariesDater.date.formatted() == cAriesDate.date.formatted()) &&
            (taurusDater.date.formatted() == cTaurusDate.date.formatted()) {
            return true}
        else {
            return false
        }

            
    }
    
    //also if time runs out u also lose
    
    
        
    
    @IBAction func tryToDefuse(_ sender: UIButton) {
        if (zInputs == zCorrects) && checkDates() {
            performSegue(withIdentifier: "defuseWin", sender: nil)
            print(aquariusDater.date)
            tbool = false
            timer!.invalidate()
            timer = nil
            print("gg")
        }
        else {
            performSegue(withIdentifier: "defuseLose", sender: nil)
            print(aquariusDater.date.formatted() == cAquariusDate.date.formatted())
            print("ha")
        }
        
    }
    

    
    
    
    
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
