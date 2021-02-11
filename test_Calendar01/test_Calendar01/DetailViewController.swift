//
//  DetailViewController.swift
//  test_Calendar01
//
//  Created by 이민우 on 2021/02/12.
//

import UIKit

// 받을 Date
var text = "test"

class DetailViewController: UIViewController {

    @IBOutlet weak var lblDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 달력에서 선택한 날짜 띄우기 (테스트)
        lblDate.text = text

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        // modal (돌아가기 성공, 선택날짜 리셋 성공, 다만 모달로 떠있음)
//        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "CalendarView")
//        vcName?.modalTransitionStyle = .coverVertical
//        self.present(vcName!, animated: true, completion: nil)
        
        // modal 사라짐 하지만 선택은 남아있음
//        self.dismiss(animated: true, completion: nil)
        
        // modal fullscreen ! 선택 날짜 리셋도 성공!
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "CalendarView")
        vcName?.modalPresentationStyle = .fullScreen
        self.present(vcName!, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
