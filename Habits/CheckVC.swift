//
//  CheckVC.swift
//  Habits
//
//  Created by 안지훈 on 7/23/22.


import UIKit
import RealmSwift

class CheckVC: UIViewController {
    
    @IBOutlet weak var checkOne: UIButton! // 첫번째 버튼
    @IBOutlet weak var checkTwo: UIButton! // 두번쨰 버튼
    @IBOutlet weak var checkThree: UIButton! // 세번째 버튼
  
    
    @IBOutlet weak var checkVCTitle: UILabel!{
        didSet{
            setTitle()
        }
    }
    
    
    // Model.daycount 활용
    // createTime -> pastTime으로 넘겨서 현재시간이랑 비교를 해야겠네
    // Date
    var initCheckVCTitle : String = "" // chekTitle 바꿀 데이터 전달 받을 변수
    var currentTime : String = "" // 그냥 처음에
    var pastTime : Date?
    var dayCount : Int = Int()

    //MARK: - overrideMethod
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        getRealmData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
   
    
    // MARK: - makeAlert (  알람메세지 )
    func makeAlert(_ count : Int){
        
        let completeAlert = UIAlertController(title: "완료",message: "\(count + 1)일째 반복", preferredStyle: UIAlertController.Style.alert) // 완료 alert
        let completeAlertAction = UIAlertAction(title: "완료 하였습니다.", style: .default)// 완료 alert 확인버튼
        let finishAlert = UIAlertController(title: " 목표 완료 ", message: "작심삼일 성공.", preferredStyle: .alert)
        let finishAlertAction = UIAlertAction(title: "확인.", style: .default)
        
        completeAlert.addAction(completeAlertAction)
        finishAlert.addAction(finishAlertAction)
        switch count {
        case 0, 1:
            present(completeAlert, animated: true, completion: nil)
            print(count)
        
        case 2:
            present(completeAlert, animated: true, completion: nil)
            present(finishAlert,animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.navigationController?.popToRootViewController(animated: true)
            }// 1 초뒤 팝뷰 , 메인쓰레드에서만 동장해야됨.-> 공부필요
        default:
            return
        }
    }
    
  
    
    
    
    // MARK : - changeButtonImage (Button이미지 변경)
    func changButtonImage(_ btnCount : Int){
        switch dayCount{
        case 0:
            checkOne.setImage(UIImage(systemName: "checkmark.seal.fill"), for: .normal) //첫번째아이콘
        case 1:
            checkTwo.setImage(UIImage(systemName: "checkmark.seal.fill"), for: .normal) // 두번째아이콘
        case 2:
            checkThree.setImage(UIImage(systemName: "checkmark.seal.fill"), for: .normal) // 세번째 아이콘
        default:
            return
        }
    }
    // MARK: - IBAction Method
    
    // MARK: clickSuccessButton ( 성공버튼 클릭 액션 )
    @IBAction func clickSuccessButton(_ sender: UIButton) {
        
        if dayCount == 3 {
            print(" dayCount : \(dayCount)")
            changButtonImage(dayCount)
        }else {
            print("dayCount : \(dayCount)")
            changButtonImage(dayCount)
        }
        makeAlert(dayCount) // 알람
        dayCount += 1 // 완료되었을 때
    }
    
}


// MARK: - setData Method


extension CheckVC {
    
    // MARK: configVC - prepared() 에서 데이터 전달 받는 데이터 변경 / title이 키 값
    func receiveItem(_ title : String) {
        print("CheckVC - receiveItem called() item : \(title)")
        self.initCheckVCTitle = title
    }
    
    
    
    //MARK: - CheckVCTitle 설정
    func setTitle(){
        print("CheckVC - setTitle called()")
        checkVCTitle.text = initCheckVCTitle // 텍스트 할당3
        // 라벨의 사이즈를 해당크기에 맞게 설정
        checkVCTitle.sizeThatFits(CGSize(width: checkVCTitle.frame.width, height: checkVCTitle.frame.height))
        // checkVCTitle.sizeToFit() -> 자동으로 라벨의 크기를 텍스트에 맞게 수정
        
        //autolayout설정으로 인한, 텍스트잘림현상 해결
        checkVCTitle.adjustsFontSizeToFitWidth = true // 라벨의 크기에 맞게 텍스트폰트변경
        checkVCTitle.minimumScaleFactor = 0.2 // 텍스트 간 최소간격
        checkVCTitle.numberOfLines = 1 // 텍스트라인의 수
    }
    //MARK - RealmData 처리
    
    //MARK:  cell에 해당하는 realm데이터 받아옴
    func getRealmData() {
        print(" CheckVC setRealmData called() ")
        let realm = try! Realm()
        guard let data = realm.objects(Habits.self).filter(NSPredicate(format: "title = %@", initCheckVCTitle )).first else { return }// title을 가지고있는 realm의 index를 찾는다.
        let time = data.createTime  // 옵셔널 바인딩
        let count = data.dayCount //
        pastTime = time // 과거시간
        dayCount = count // 성공횟수
        print(data)
        print(pastTime)
        print(dayCount)
    }
    
    
    
    
}
