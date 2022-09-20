//
//  SoundPlay.swift
//  Devolper
//
//  Created by hazem smawy on 9/20/22.
//

import Foundation
import AVFoundation


var audioPlayer: AVAudioPlayer?

func playSound(sound :String,type:String) {
    
    if let path = Bundle.main.path(forResource: sound, ofType: "mp3") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch {
         print("could not play sound")
        }
    }
}
