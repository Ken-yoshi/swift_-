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
    
    var winAction = Bundle.main.bundleURL.appendingPathComponent("win.m4a")
    
    var loseAction =
        Bundle.main.bundleURL.appendingPathComponent("lost.m4a")
    
    var shufflePlayer = AVAudioPlayer()
    var winPlayer = AVAudioPlayer()
    var losePlayer = AVAudioPlayer()
    
    @IBOutlet weak var answerImageView: UIImageView!
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var answerNumber = 0
    var jugeNumber = 0
    
    @IBAction func shuffleAction(_ sender: Any) {
       
        //ジャンケンの声かけ
        do {
            shufflePlayer = try AVAudioPlayer(contentsOf: shuffleAction, fileTypeHint: nil)
            
            shufflePlayer.play()
        } catch {
            print("音声エラー")
        }
        
        
        //ジャンケンの手をランダムで変更するための乱数
        var newAnswerNumber = 0
        newAnswerNumber = Int.random(in:0..<3)
         answerNumber = newAnswerNumber
        
        //勝ち負けをランダムで変更するための乱数
        var newjugeNumber = 0
        newjugeNumber = Int.random(in:0..<2)
         jugeNumber = newjugeNumber
        
        //ジャンケンポンの掛け声と同時に手を出す
        if answerNumber == 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                self.answerLabel.text = "グー"
                self.answerImageView.image = UIImage(named:"gu")
                
                if self.jugeNumber == 0 {
                    
                    do {
                        self.winPlayer = try AVAudioPlayer(contentsOf: self.winAction, fileTypeHint: nil)
                        
                        self.winPlayer.play()
                    } catch {
                        print("音声エラー")
                    }
                } else {
                    do {
                        self.losePlayer = try AVAudioPlayer(contentsOf: self.loseAction, fileTypeHint: nil)
                        
                        self.losePlayer.play()
                    } catch {
                        print("音声エラー")
                    }
                }
            }
            
        } else if answerNumber == 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                self.answerLabel.text = "チョキ"
                self.answerImageView.image = UIImage(named:"choki")
                
                if self.jugeNumber == 0 {
                    
                    do {
                        self.winPlayer = try AVAudioPlayer(contentsOf: self.winAction, fileTypeHint: nil)
                        
                        self.winPlayer.play()
                    } catch {
                        print("音声エラー")
                    }
                } else {
                    do {
                        self.losePlayer = try AVAudioPlayer(contentsOf: self.loseAction, fileTypeHint: nil)
                        
                        self.losePlayer.play()
                    } catch {
                        print("音声エラー")
                    }
                }
            }
        } else if answerNumber == 2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                self.answerLabel.text = "パー"
                self.answerImageView.image = UIImage(named:"pa")
                
                if self.jugeNumber == 0 {
                    do {
                        self.winPlayer = try AVAudioPlayer(contentsOf: self.winAction, fileTypeHint: nil)
                        
                        self.winPlayer.play()
                    } catch {
                        print("音声エラー")
                    }
                } else {
                    do {
                        self.losePlayer = try AVAudioPlayer(contentsOf: self.loseAction, fileTypeHint: nil)
                        
                        self.losePlayer.play()
                    } catch {
                        print("音声エラー")
                    }
                }
            }
        }
    }
}

