//
//  AddViewController.swift
//  test_Calendar01
//
//  Created by 이민우 on 2021/02/12.
//

import UIKit

// SelectView로 부터 데이터 받는 변수들
var addViewSelectDate = ""
var addViewImageName = ""

class AddViewController: UIViewController {

    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgEmoticon: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 받아온 값 띄우기
        lblDate.text = addViewSelectDate
        imgEmoticon.image = UIImage(named: addViewImageName)
        
        // textView 디자인
        setTextViewDesign()
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        moveView(target: "EmoticonView")
    }
    @IBAction func btnAddContent(_ sender: UIButton) {
    }
    
    // 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setTextViewDesign(){
        // 경계선 굵기
        txtView.layer.borderWidth = 1
        
        // 컬러 주기 방법1
//        txtView.layer.borderColor = CGColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        // 컬러 주기 방법2
        txtView.layer.borderColor = UIColor.black.cgColor
        
        // 경계선 shape
        txtView.layer.cornerRadius = 10
        
    }
    
    // 다음화면 및 backBtn 함수
    func moveView(target : String){
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: target)
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
