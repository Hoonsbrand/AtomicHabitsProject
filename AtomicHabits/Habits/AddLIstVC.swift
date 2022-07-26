//
//  addLIstVC.swift
//  Habits
//
//  Created by 안지훈 on 7/22/22.
//

import UIKit
import RealmSwift
import Toast_Swift

class AddLIstVC: UIViewController, UITextFieldDelegate {
    
    let realm = try! Realm()
    
    @IBOutlet weak var inputHabitTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        inputHabitTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        inputHabitTextField.delegate = self
        inputHabitTextField.becomeFirstResponder()                                          // 첫번째 응답자로 설정함으로써 뷰가 보이자마자 텍스트필드에 자동으로 커서랑 키보드가 올라옴
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: textField Delegate Method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let textFieldText = textField.text else { return false }                      // textField.text guard let 바인딩
        
        let count = textFieldText.count + string.count                                      // textField에 있는 문자들과 사용자가 입력한 문자의 합 개수
        
        if count >= 15 && !string.isEmpty {                                                 // count가 15가 넘으면 Toast 팝업, 백스페이스(지우기)를 누를 땐 글자수가 15자라도 토스트 팝업 x
            self.view.makeToast("15자 내로 작성해주세요.", duration: 1.5, point: CGPoint(x: 187, y: 200), title: nil, image: nil, style: .init(), completion: nil)
        }
        
        return count <= 15                                                                  // count가 15보다 크다면 false이므로 더 이상 글자 추가 불가
    }
    
    // MARK: backToView
    @IBAction func backToView(_ sender: UIButton) {
        
        if sender.currentTitle == "등록" {
            if let habitTitle = inputHabitTextField.text {
                if habitTitle == "" {                                                       // 습관 이름을 안쓰고 등록을 누르면 Toast 팝업
                    self.view.makeToast("습관을 입력해주세요!", duration: 1.5, point: CGPoint(x: 187, y: 200), title: nil, image: nil, completion: nil)
                    return
                }
                let newHabit = Habits(title: habitTitle, createTime: Date())
                
                try! realm.write {
                    realm.add(newHabit)
                }
              
                navigationController?.popViewController(animated: true)
            }
        }
        else {
            navigationController?.popViewController(animated: true)                          // 돌아가기를 누르면 아무 행동도 하지 않고 뷰 전환
        }
    }
    
    // MARK: 다른 곳 탭 했을 때 키보드가 사라지는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


