//
//  ViewController.swift
//  jan
//
//  Created by yoshida kensuke on 2020/10/16.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var shuffleAction = Bundle.main.bundleURL.appendingPathComponent("audio_16383.wav")
    
    var shufflePlayer = AVAudioPlayer()
    
    @IBOutlet weak var answerImageView: UIImageView!
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var answerNumber = 0
    
    @IBAction func shuffleAction(_ sender: Any) {
       
        do {
            shufflePlayer = try AVAudioPlayer(contentsOf: shuffleAction, fileTypeHint: nil)
            
            shufflePlayer.play()
        } catch {
            print("音声エラー")
        }
        var newAnswerNumber = 0
        
        repeat{
            newAnswerNumber = Int.random(in:0..<3)
        }while
            newAnswerNumber == self.answerNumber
        
         answerNumber = newAnswerNumber
        //ジャンケンポンの掛け声と同時に手を出す
        if answerNumber == 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                self.answerLabel.text = "グー"
                self.answerImageView.image = UIImage(named:"gu")
            }
        } else if answerNumber == 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                self.answerLabel.text = "チョキ"
                self.answerImageView.image = UIImage(named:"choki")
            }
        } else if answerNumber == 2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                self.answerLabel.text = "パー"
                self.answerImageView.image = UIImage(named:"pa")
            }
        }
        
        
        
    }
    
    
        
       

       
}

