//
//  ViewController.swift
//  Dicee
//
//  Created by Samuel Bartlett on 16/10/2018.
//  Copyright © 2018 Samuel Bartlett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDIceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    let diceImages: [UIImage] = [UIImage(named: "dice1.png")!, UIImage(named: "dice2.png")!, UIImage(named: "dice3.png")!, UIImage(named: "dice4.png")!, UIImage(named: "dice5.png")!, UIImage(named: "dice6.png")! ]
    var i: Int = 0

    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var rollButtonText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the dice image animation arrays
        diceImageView1.animationImages = diceImages
        diceImageView2.animationImages = diceImages.reversed()
        //set the duration of each animation frame
        diceImageView1.animationDuration = 0.5
        diceImageView2.animationDuration = 0.5
        //start the animations
        animateDiceStart()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        //check what state the dice are in
        checkDiceStatus()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        checkDiceStatus()
    }
    
    func animateDiceStart(){
        //start the individual dice faces to animate
        diceImageView2.startAnimating()
        diceImageView1.startAnimating()
        //change button text to remain consistent with what we want it to do
        rollButtonText.setTitle("Stop Rolling", for: .normal)
    }
    func animateDiceStop(){
        //select the random index for dice number
        randomDIceIndex1 = Int.random(in: 0 ... 5) //Random number from 0 up to, and including 5
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        //stop the dice from animating
        diceImageView2.stopAnimating()
        diceImageView1.stopAnimating()
        //set the dice face to the randomly selected dice face
        diceImageView1.image = diceImages[randomDIceIndex1]
        diceImageView2.image = diceImages[randomDiceIndex2]
        //update the button text to remain consistent with what we want it to do
        rollButtonText.setTitle("Start Rolling", for: .normal)
    }
    
    func checkDiceStatus(){
        if diceImageView1.isAnimating == true && diceImageView2.isAnimating == true{
            //stop animating
            animateDiceStop()
        }else{
            //restart animating
            animateDiceStart()
        }
    }
}
