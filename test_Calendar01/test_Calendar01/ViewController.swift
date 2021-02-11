//
//  ViewController.swift
//  test_Calendar01
//
//  Created by 이민우 on 2021/02/11.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

  
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPreview: UIButton!
    @IBOutlet weak var myCalendar: FSCalendar!
    
    // 테스트 이미지
    let lamp_Off = UIImage(named: "arrow-up-red.png")
    let lamp_On = UIImage(named: "pencil.png")
    let lamp_Pink = UIImage(named: "lamp_pink.png")
    
    // 선택한 날짜 변수
    var selectDate = ""
    
    // 현재 날짜 (OS)
    var current_date_string = ""
    
    // 현재 날짜 (currentPage)
    var currentPageDate = ""
    
    // Date 함수 변수
    let dateFormatter = DateFormatter()
    
    // 이벤트 추가할 날짜 배열(글 등록한 날을 저장해야할 듯)
    var eventDates = [Date]()
    
    // moveCurrentPage함수를 위한 변수
    private var currentPage: Date?
    private lazy var today: Date = {
        return Date()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 현재 년월 구하기 (btnNext 제한하기 위함)
        dateFormatter.dateFormat = "YYYY-MM-dd"
        current_date_string = dateFormatter.string(from: Date())

        // calendar 디자인
        calendarDesign()
        
        myCalendar.delegate = self
        myCalendar.dataSource = self
        
        // 다른 버튼들과 혼용할 때는 다음과 같이 view안으로 집어넣어줘야한다.
        view.addSubview(myCalendar)
        myCalendar.addSubview(btnPreview)
        myCalendar.addSubview(btnNext)
        
        // btnNext 제한두기 (미래로 갈 수 없다)
        btnNext.isHidden = true
        
        // 이벤트 적용 테스트 변수 설정
        let xmas = dateFormatter.date(from: "2021-02-10")
        let sampledate = dateFormatter.date(from: "2021-02-01")
        eventDates = [xmas!, sampledate!]
        
    }

    // 이전달로 이동하는 Button
    @IBAction func btnPreview(_ sender: UIButton) {
        btnNext.isHidden = false
        self.moveCurrentPage(moveUp: false)
    }
    // 다음달로 이동하는 Button
    @IBAction func btnNext(_ sender: UIButton) {
        cantMoveNextMonth()
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        
    }
    
    private func moveCurrentPage(moveUp: Bool) {
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = moveUp ? 1 : -1 // true면 1증가 false면 1감소
        
        self.currentPage = calendar.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.myCalendar.setCurrentPage(self.currentPage!, animated: true)
        
        currentPageDate = dateFormatter.string(from: currentPage!)

    }

    func calendarDesign(){
        // 배경색
//        myCalendar.backgroundColor = UIColor(red: 241/255, green: 249/255, blue: 255/255, alpha: 1)
        
        // 선택한 날짜색
        myCalendar.appearance.selectionColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        
        // 오늘 날짜색
        myCalendar.appearance.todayColor = UIColor(red: 188/255, green: 224/255, blue: 253/255, alpha: 1)
        
        // 여러 날짜 선택
        myCalendar.allowsMultipleSelection = true
        
        // 스와이프 이용 다중 선택
//        myCalendar.swipeToChooseGesture.isEnabled = true
        
        // 스와이프 스크롤 작동 여부 ( 활성화하면 좌측 우측 상단에 다음달 살짝 보임, 비활성화하면 사라짐 )
        myCalendar.scrollEnabled = true
        
        // 스와이프 스크롤 방향 ( 버티칼로 스와이프 설정하면 좌측 우측 상단 다음달 표시 없어짐, 호리젠탈은 보임 )
//        myCalendar.scrollDirection = .vertical
        
        // 선택된 날짜의 모서리 설정 ( 0 => 사각형, 1 => 원형)
        myCalendar.appearance.borderRadius = 1
        
        // 달력의 평일 날짜 색깔
        myCalendar.appearance.titleDefaultColor = .black

        // 달력의 토,일 날짜 색깔
        myCalendar.appearance.titleWeekendColor = .red

        // 달력의 맨 위의 년도, 월의 색깔
        myCalendar.appearance.headerTitleColor = .systemPink

        // 달력의 요일 글자 색깔
        myCalendar.appearance.weekdayTextColor = .orange
        
        // 타이틀 컬러
        myCalendar.appearance.titleSelectionColor = .black
        
        // 서브 타이틀 컬러
        myCalendar.appearance.subtitleSelectionColor = .black
        
        // 달력의 년월 글자 바꾸기
        myCalendar.appearance.headerDateFormat = "YYYY년 M월"

        // 달력의 요일 글자 바꾸는 방법 1
        myCalendar.locale = Locale(identifier: "ko_KR")
                
        // 달력의 요일 글자 바꾸는 방법 2
        myCalendar.calendarWeekdayView.weekdayLabels[0].text = "일"
        myCalendar.calendarWeekdayView.weekdayLabels[1].text = "월"
        myCalendar.calendarWeekdayView.weekdayLabels[2].text = "화"
        myCalendar.calendarWeekdayView.weekdayLabels[3].text = "수"
        myCalendar.calendarWeekdayView.weekdayLabels[4].text = "목"
        myCalendar.calendarWeekdayView.weekdayLabels[5].text = "금"
        myCalendar.calendarWeekdayView.weekdayLabels[6].text = "토"
        
        // 이전, 다음 년월 안보이게 하기
        myCalendar.appearance.headerMinimumDissolvedAlpha = 0
        
        // 이벤트 기본 날짜
        myCalendar.appearance.eventDefaultColor = UIColor.green
        
        // 이벤트 선택 날짜
        myCalendar.appearance.eventSelectionColor = UIColor.green

    }
    
    // 날짜 선택 시 콜백 메소드
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectDate = dateFormatter.string(from: date)
        print(dateFormatter.string(from: date) + " 선택됨")
        
        // 만약 이미 글이 등록된 날짜를 선택했을 경우 Detail화면으로 보내버리기!
        if self.eventDates.contains(date){
//            myCalendar.allowsSelection = false // 전체 셀 선택 가능 여부 (false 불가능)
         
            // pushView
//            guard let vcName = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController else { return }
//            self.navigationController?.pushViewController(vcName, animated: true)
            
            print("이미 이벤트 발생한 날짜!")
            
            // 선택한 날짜 보내기
            text = dateFormatter.string(from: date)
            
            // modal을 pull로 띄우기 (선택날짜 리셋 가능)
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "DetailView")
            vcName?.modalPresentationStyle = .fullScreen
            self.present(vcName!, animated: true, completion: nil)
        }
    }
    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectDate = dateFormatter.string(from: date)
        print(dateFormatter.string(from: date) + " 해제됨")
    }
    // 날짜 및 문자열 표시
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//            
//            switch dateFormatter.string(from: date) {
//            case dateFormatter.string(from: Date()):
//                return "오늘"
//            case "2021-02-08":
//                return "출근"
//            case "2021-02-09":
//                return "지각"
//            case "2021-02-10":
//                return "결근"
//            default:
//                return nil
//            }
//    }
    // 날짜 대신 문자열 출력
//    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//            switch dateFormatter.string(from: date) {
//            case "2021-02-12":
//                return "D-day"
//            default:
//                return nil
//            }
//    }
    // 날짜 대신 이미지 출력
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
        switch dateFormatter.string(from: date) {
        case selectDate:
            return lamp_On
        default:
            return nil
        }
    }
    // 날짜별 선택 색상 변경
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
            
            switch dateFormatter.string(from: date) {
            case "2021-02-11":
                return .green
            case "2021-02-10":
                return .yellow
            case "2021-02-09":
                return .red
            default:
                return appearance.selectionColor
            }
    }
    
    // 날짜 선택 최대 가능 개수
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
            // 날짜 3개까지만 선택되도록
            if calendar.selectedDates.count > 0 {
                return false
            } else {
                return true
            }
    }
    
    // 오늘까지만 선택 가능 함수
    func maximumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    // 이벤트 등록된 날짜 표시 함수
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.eventDates.contains(date){
            return 1
        }
        return 0
    }
    
    // 한번 선택하면 풀 수가 없다.. (왜 있지?)
//    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
//        if self.eventDates.contains(date){
//            print("확인중1")
//            return false
//        }
//        print("확인중2")
//        return true
//    }
    
    //
    
    // 현재 월 기준 다음달 이동 제한 함수
    func cantMoveNextMonth(){
        // currentPage 변화값 저장 변수
        let varDate = Int(String(currentPageDate.split(separator: "-")[0]) + String(currentPageDate.split(separator: "-")[1]))
        // OS의 date 저장 변수
        let pixDate = Int(String(current_date_string.split(separator: "-")[0]) + String(current_date_string.split(separator: "-")[1]))

        self.moveCurrentPage(moveUp: true)
        
        // 버튼을 누른 후에 버튼을 감춰야하므로 varDate + 1을 해서 비교한다.
        if (varDate! + 1) == pixDate!{
            btnNext.isHidden = true
        }else{
            btnNext.isHidden = false
        }
    }
    
}

