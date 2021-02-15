//
//  Speech.swift
//  x01
//
//  Created by Alec Henderson on 15/02/2021.
//

import Foundation
import AVKit
class Speech{
    
    var speechSynthesizer = AVSpeechSynthesizer()
    
    func talk(phrase:String){
        let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: phrase)
        speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        speechSynthesizer.speak(speechUtterance)
    }
}
