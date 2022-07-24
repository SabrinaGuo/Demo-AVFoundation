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
    
    
    @IBOutlet weak var btnEnglish: UIButton!
    
    @IBOutlet weak var btnMandarin: UIButton!
    
    @IBOutlet weak var btnSpanish: UIButton!
    
    @IBOutlet weak var btnFrech: UIButton!
    
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

    
    @IBAction func choseLanguages(_ sender: UIButton) {
        switch sender{
        case btnEnglish:
            language = "en-IE" //語系設定
            // 如果使用者沒有輸入任何文字時
            if(speakWords.text==""){
                speak("please enter text")
            }
        case btnMandarin:
            language = "zh-TW"
            if(speakWords.text==""){
                speak("請輸入文字")
            }
        case btnSpanish:
            language = "es-ES"
            if(speakWords.text==""){
                speak("por favor ingrese texto")
            }
        case btnFrech:
            language = "fr-FR"
            if(speakWords.text==""){
                speak("veuillez entrer du texte")
            }
        default: break
        }
        speak(speakWords.text!) //唸出來！
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
