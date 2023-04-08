//
//  AudioPlayer.swift
//  Restart
//
//  Created by Rehnuma Reza on 8/4/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?
func playSound(sound: String, type: String) {
    guard let soundPath = Bundle.main.path(forResource: sound, ofType: type)
    else { return }
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath))
        audioPlayer?.play()
    } catch { print("Sound is unable to be played") }
}
