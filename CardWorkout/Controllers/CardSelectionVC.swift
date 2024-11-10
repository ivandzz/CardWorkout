//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Іван Джулинський on 25/08/24.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var cards: [UIImage] = Deck.allValues
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for button in buttons {
            button.layer.cornerRadius = 8
        }
        
        startTimer()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer.invalidate()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AH")
    }
    
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
