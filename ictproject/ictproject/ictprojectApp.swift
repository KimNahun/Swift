import SwiftUI
import FirebaseCore
import Firebase
//공지 크롤링
public var tempTitle = [String]()
public var tempTitle1 = [String]()
public var tempTitle2 = [String]()
public var tempTitle3 = [String]()
public var tempTitle4 = [String]()
public var myArray1 = [[String]](repeating: [String](repeating: "", count: 5), count: 40)
public var myArray2 = [[String]](repeating: [String](repeating: "", count: 5), count: 40)
public var myArray3 = [[String]](repeating: [String](repeating: "", count: 5), count: 40)
public var myArray4 = [[String]](repeating: [String](repeating: "", count: 5), count: 40)
public var myArray = [[String]](repeating: [String](repeating: "", count: 5), count: 40)

public var keywords = [String]() //사용자가 등록한 키워드
public var noticeTitle = [String]()
public var searchWord = "" //검색중인단어
public var searchingWord = false //검색중인상태
public var selectNoticeType = 0 // 일반공지, 학사공지, 장학공지 (근데 이거 필요없는듯?)
public var idfv:String? = UIDevice.current.identifierForVendor?.uuidString

var getFirebase = FireBaseViewController()

struct Notice: Codable {
    let category: String
    let date: String
    let link: String
    let number: Int
    let title: String
    let writer: String
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        getFirebase.readFireBaseData1()
        getFirebase.readFireBaseData2()
        getFirebase.readFireBaseData3()
        getFirebase.getMyIDData()
        
        return true
    }
}



@main
struct ictprojectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
