//
//  SelectViewController.swift
//  test_Calendar01
//
//  Created by 이민우 on 2021/02/12.
//

import UIKit

// date 받는 변수
var emoticonViewSelectDate = ""

class SelectViewController: UIViewController {
    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var image2: UIButton!
    @IBOutlet weak var image3: UIButton!
    @IBOutlet weak var image4: UIButton!
    @IBOutlet weak var image5: UIButton!
    @IBOutlet weak var image6: UIButton!
    @IBOutlet weak var image7: UIButton!
    @IBOutlet weak var image8: UIButton!
    @IBOutlet weak var image9: UIButton!
    @IBOutlet weak var image10: UIButton!
    @IBOutlet weak var image11: UIButton!
    @IBOutlet weak var image12: UIButton!
    
    // 클릭된 버튼 변수
    var selectBtnNum = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기 이미지 설정
        image1.layer.borderWidth = 2
        image1.layer.borderColor = UIColor.green.cgColor
        
        print(emoticonViewSelectDate)
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        moveView(target: "CalendarView")
    }
    @IBAction func btnDone(_ sender: UIButton) {
        addViewImageName = findSelectedBtn()
        addViewSelectDate = emoticonViewSelectDate
        
        moveView(target: "AddView")
    }
    
    @IBAction func btnImage1(_ sender: UIButton) {
        selectBtnNum = 1
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    @IBAction func btnImage2(_ sender: UIButton) {
        selectBtnNum = 2
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    @IBAction func btnImage3(_ sender: UIButton) {
        selectBtnNum = 3
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    @IBAction func btnImage4(_ sender: UIButton) {
        selectBtnNum = 4
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    @IBAction func btnImage5(_ sender: UIButton) {
        selectBtnNum = 5
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    @IBAction func btnImage6(_ sender: UIButton) {
        selectBtnNum = 6
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    @IBAction func btnImage7(_ sender: UIButton) {
        selectBtnNum = 7
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    @IBAction func btnImage8(_ sender: UIButton) {
        selectBtnNum = 8
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    @IBAction func btnImage9(_ sender: UIButton) {
        selectBtnNum = 9
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    @IBAction func btnImage10(_ sender: UIButton) {
        selectBtnNum = 10
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    @IBAction func btnImage11(_ sender: UIButton) {
        selectBtnNum = 11
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    @IBAction func btnImage12(_ sender: UIButton) {
        selectBtnNum = 12
        resetBorder()
        clickBtnOnlyOne(btn: sender)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // 클릭된 버튼 border 
    func clickBtnOnlyOne(btn : UIButton){
        // border 설정
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.green.cgColor
    }
    // 모든 버튼 border 리셋하기
    func resetBorder(){
        image1.layer.borderWidth = 0
        image2.layer.borderWidth = 0
        image3.layer.borderWidth = 0
        image4.layer.borderWidth = 0
        image5.layer.borderWidth = 0
        image6.layer.borderWidth = 0
        image7.layer.borderWidth = 0
        image8.layer.borderWidth = 0
        image9.layer.borderWidth = 0
        image10.layer.borderWidth = 0
        image11.layer.borderWidth = 0
        image12.layer.borderWidth = 0

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "AddView"{
//            let AddView = segue.destination as! AddViewController // 보낼 컨트롤러 설정
//            AddView.selectDate = self.selectDate
//            AddView.imageName = findSelectedBtn()
//        }
//    }
    
    // 클릭된 이미지에 따른 이미지명 return 함수
    func findSelectedBtn() -> String{
        print("클릭한 버튼값 : ", selectBtnNum)
        
        switch selectBtnNum{
        case 1:
            return "happy.jpeg"
        case 2:
            return "angry.jpeg"
        case 3:
            return "gloomy.jpeg"
        case 4:
            return "pleasure.jpeg"
        case 5:
            return "proud.jpeg"
        case 6:
            return "sad.jpeg"
        case 7:
            return "tired.jpeg"
        case 8:
            return "unrest.jpeg"
        case 9:
            return "arrow-up-red.png"
        case 10:
            return "lamp_off.png"
        case 11:
            return "lamp_on.png"
        default:
            return "lamp_pink.png"

        }
    }
    
    // 다음화면 및 backBtn 함수
    func moveView(target : String){
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: target)
        vcName?.modalPresentationStyle = .fullScreen
        self.present(vcName!, animated: true, completion: nil)
    }
}
