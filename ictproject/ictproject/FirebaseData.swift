import UIKit
import Firebase



class FireBaseViewController: UIViewController {
    
    //firebase의 멘 headkey를 가져온다.
    var headDB : DatabaseReference  = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func getMyIDData() {
        let refKeyword = Database.database().reference().child("유저정보").child("식별자").child(idfv!).child("등록된키워드")
            refKeyword.observeSingleEvent(of: .value) { snapshot in
                guard let readFirbaseKeywords = snapshot.value as? [String] else { return }
                for i in readFirbaseKeywords {
                    keywords.append(i)
                }
            }
    }
    func waitDelay() {
        let delayTime = DispatchTime.now() + 10.0
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            // 1초 후 실행할 코드
        }
    }
    func readFireBaseData1() {
        if(tempTitle1.count==0){
            var idx1 = 0
            headDB.child("일반공지").observeSingleEvent(of: .value) { (snapshot) in
                if let data = snapshot.value as? [String: Any] {
                    for (key, value) in data {
                        var idx2 = 0
                        if let notice = value as? [String: Any] {
                            if let title = notice["title"] as? String {
                                tempTitle1.append(title)
                                myArray1[idx1][idx2] = title
                                idx2+=1
                                //                     print(title)
                            }
                            if let number = notice["number"] as? String {
                                //                    print(number)
                                myArray1[idx1][idx2] = number
                                idx2+=1
                            }
                            if let category = notice["category"] as? String {
                                //                   print(category)
                                
                            }
                            if let date = notice["date"] as? String {
                                //                    print(date)
                                myArray1[idx1][idx2] = date
                                idx2+=1
                            }
                            if let link = notice["link"] as? String {
                                //                    print(link)
                                myArray1[idx1][idx2] = link
                                idx2+=1
                            }
                            if let writer = notice["writer"] as? String {
                                //                   print(writer)
                                myArray1[idx1][idx2] = writer
                                idx2+=1
                            }
                        }
                        idx1+=1
                        
                    }
                } else {
                    print("Error decoding data")
                }
                
                tempTitle=tempTitle1
                myArray=myArray1
                
                
            }
            
        }
    }
    func readFireBaseData2() {
        
        if(tempTitle2.count==0){
            var idx1 = 0
            headDB.child("장학공지").observeSingleEvent(of: .value) { (snapshot) in
                
                if let data = snapshot.value as? [String: Any] {
                    for (key, value) in data {
                        var idx2 = 0
                        if let notice = value as? [String: Any] {
                            if let title = notice["title"] as? String {
                                tempTitle2.append(title)
                                myArray2[idx1][idx2] = title
                                idx2+=1
                                //                     print(title)
                            }
                            if let number = notice["number"] as? String {
                                //                    print(number)
                                myArray2[idx1][idx2] = number
                                idx2+=1
                            }
                            if let category = notice["category"] as? String {
                                //                   print(category)
                                
                            }
                            if let date = notice["date"] as? String {
                                //                    print(date)
                                myArray2[idx1][idx2] = date
                                idx2+=1
                            }
                            if let link = notice["link"] as? String {
                                //                    print(link)
                                myArray2[idx1][idx2] = link
                                idx2+=1
                            }
                            if let writer = notice["writer"] as? String {
                                //                   print(writer)
                                myArray2[idx1][idx2] = writer
                                idx2+=1
                            }
                        }
                        idx1+=1
                        
                    }
                } else {
                    print("Error decoding data")
                }
                
                tempTitle=tempTitle2
                
                
            }
            
        }
    }
    func readFireBaseData3() {
        
        if(tempTitle3.count==0){
            var idx1 = 0
            headDB.child("학사공지").observeSingleEvent(of: .value) { (snapshot) in
                
                if let data = snapshot.value as? [String: Any] {
                    for (key, value) in data {
                        var idx2 = 0
                        if let notice = value as? [String: Any] {
                            if let title = notice["title"] as? String {
                                tempTitle3.append(title)
                                myArray3[idx1][idx2] = title
                                idx2+=1
                                //                     print(title)
                            }
                            if let number = notice["number"] as? String {
                                //                    print(number)
                                myArray3[idx1][idx2] = number
                                idx2+=1
                            }
                            if let category = notice["category"] as? String {
                                //                   print(category)
                                
                            }
                            if let date = notice["date"] as? String {
                                //                    print(date)
                                myArray3[idx1][idx2] = date
                                idx2+=1
                            }
                            if let link = notice["link"] as? String {
                                //                    print(link)
                                myArray3[idx1][idx2] = link
                                idx2+=1
                            }
                            if let writer = notice["writer"] as? String {
                                //                   print(writer)
                                myArray3[idx1][idx2] = writer
                                idx2+=1
                            }
                        }
                        idx1+=1
                        
                    }
                } else {
                    print("Error decoding data")
                }
                
                
                myArray=myArray3
                
                
            }
            
        }
    }
}
