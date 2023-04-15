
//
//  ViewController.swift
//  iosCrawling
//
//  Created by YOONJONG on 2021/02/02.
//

import UIKit
import SwiftSoup
import UserNotifications

var keyword = [String]()
var end = false


class ViewController: UIViewController {
    
    @IBOutlet weak var guideLine: UILabel!
    @IBOutlet weak var textAdd: UITextField!
    @IBOutlet weak var addedKeyword: UILabel!
    @IBOutlet weak var myKeyword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert], completionHandler: { (didAllow, error) in
            
        })
        
        UNUserNotificationCenter.current().delegate = self
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        koreatechCrawl()
    }
    
    @IBAction func addButton(_ sender: UIButton) {
       
        keyword.append(textAdd.text!)
        
        if(keyword.count == 1){
            myKeyword.text = String(keyword.count)+". "+textAdd.text!
          
          }
        else{
            myKeyword.text = myKeyword.text! + "\n" + String(keyword.count)+". " + textAdd.text!
        
        }
       
        
    
        textAdd.text=""
    }
    
    
    
}

func containsKeyword(_ word: String,_ title: String) {
    let content = UNMutableNotificationContent()
    content.title = "\(word)의 새로운 공지가 등록되었습니다."
    content.body = "\(title)"
    content.sound = .default
    content.summaryArgument = "Alan Walker"
    content.summaryArgumentCount = 40

    let identifier = UUID().uuidString // 유니크한 identifier 생성

    let TimeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1 , repeats: false)
    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: TimeIntervalTrigger)
    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
}


func koreatechCrawl() { //긁어오기
    let url = URL(string: "https://www.koreatech.ac.kr/kor/CMS/NoticeMgr/list.do?mCode=MN230")

    guard let myURL = url else { return }

    let task = URLSession.shared.dataTask(with: myURL) { (data, response, error) in
        if error != nil {
            print(error!)
            return
        }

        do {
            let html = String(data: data!, encoding: .utf8)!
            let doc: Document = try SwiftSoup.parse(html)
            let headerTitle = try doc.title()
          
            
            let numElements: Elements = try doc.select(".num").select("td")
            let titleElements: Elements = try doc.select(".subject").select("a")
            let dateElements: Elements = try doc.select(".date").select("td")
            let writerElements: Elements = try doc.select(".writer").select("td")
            let cntElements: Elements = try doc.select(".cnt").select("td")
           
            for i in 0..<titleElements.count {
                let titleElement = titleElements[i]
                let title = try titleElement.text()
                let dateElement = dateElements[i]
                let writerElement = writerElements[i]
                let cntElement = cntElements[i]
                
                for word in keyword {
            
                    if(title.contains(word)){
                     
                        containsKeyword(word,title)
                    }
                    
                }
               
                
                let num = try numElements[0].text()
                let classification = try numElements[1].text()
                let date = try dateElement.text()
                let writer = try writerElement.text()
                let cnt = try cntElement.text()

                print(" \(num)  \(classification)  \(title) \(date) \(writer) \(cnt)",terminator: "\n\n")
                
            }
            
        } catch Exception.Error(_, let message) {
            print("Message: \(message)")
        } catch {
            print("error")
        }
    }
    task.resume()
} //긁어오기

extension ViewController : UNUserNotificationCenterDelegate {
    //To display notifications when app is running  inforeground
    
    //앱이 foreground에 있을 때. 즉 앱안에 있어도 push알림을 받게 해줍니다.
    //viewDidLoad()에 UNUserNotificationCenter.current().delegate = self를 추가해주는 것을 잊지마세요.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        let settingsViewController = UIViewController()
        settingsViewController.view.backgroundColor = .gray
        self.present(settingsViewController, animated: true, completion: nil)
        
    }
}
