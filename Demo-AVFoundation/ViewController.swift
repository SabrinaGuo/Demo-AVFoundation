//
//  ViewController.swift
//  Demo-AVFoundation
//
//  Created by 郭怡玲 on 2022/7/24.
//

import UIKit
import AVFoundation // 說話ＳＤＫ需 import

class ViewController: UIViewController {
    var language:String = "" // 語系設定
    var speechUtterance = AVSpeechUtterance(string:"") // 要說的內容文字
   
    @IBOutlet weak var speakWords: UITextField!// 變數：紀錄 text Field 的內容
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //app 開啟時自動說話 안녕하세요
        let speechUtterance = AVSpeechUtterance(string:"안녕하세요")// 變數：文字設定
        speechUtterance.voice = AVSpeechSynthesisVoice(language:"ko-KR")// AVSpeechSynthesisVoice 為語系設定
        let synthesizer = AVSpeechSynthesizer() // AVSpeechSynthesizer()  為生成合成語音並能夠監視或控制正在進行的語音的對象
        synthesizer.speak(speechUtterance) // 放入文字設定變數內容
      
    }

    
    func speak(_ text:String){
        // 參數：text 文字內容
        speechUtterance = AVSpeechUtterance(string:text)
        print(text)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: language)
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }

    @IBAction func choseEnglish(_ sender: Any) {
        language = "en-IE"
       
        // 如果使用者沒有輸入任何文字時
        if(speakWords.text==""){
            speak("no words")
        }
        speak(speakWords.text!)
    }
    
    
    @IBAction func choseMandarin(_ sender: Any) {
        language = "zh-TW"
      
        // 如果使用者沒有輸入任何文字時
        if(speakWords.text==""){
            speak("no words")
        }
        speak(speakWords.text!)
    }
    
    
    @IBAction func choseSpanish(_ sender: Any) {
        language = "es-ES"
       
        // 如果使用者沒有輸入任何文字時
        if(speakWords.text==""){
            speak("no words")
        }
        speak(speakWords.text!)
    }
    
    @IBAction func choseFrech(_ sender: Any) {
        language = "fr-FR"
        
        // 如果使用者沒有輸入任何文字時
        if(speakWords.text==""){
            speak("no words")
        }
        speak(speakWords.text!)
    }
    
    //當點擊view任何喔一處鍵盤收起
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    }

    //點擊鍵盤 return 鍵盤收起
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
}
