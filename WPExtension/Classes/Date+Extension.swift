//
//  Date+Extension.swift
//  WPExtension
//
//  Created by Hyeontae on 2021/01/25.
//

import Foundation

public extension Date {
    /**
     자주 사용되는 DateFormat 을 표현함
     
     convenience init 혹은 formattedString 등 자체 Date Extension 에서도 사용된다.
     
     How
     ===
     
     TestCase
     ===
     ```
     inclueded by other test
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    enum WPDateFormat: String {
        case dotDate = "yyyy.MM.dd"
        case dotDateUntilMinute = "yyyy.MM.dd HH:mm"
        case dotDateUntilSecond = "yyyy.MM.dd HH:mm:ss"
        
        case dashDate = "yyyy-MM-dd"
        case dashDateUntilMinute = "yyyy-MM-dd HH:mm"
        case dashDateUntilSecond = "yyyy-MM-dd HH:mm:ss"
        
        case serverDate = "yyyy-MM-dd'T'HH:mm:ss.SSZ"
    }
    /**
     date 가 오늘 날짜를 지칭하는지 확인한다.
     
     How
     ===
     date.isToday
     
     TestCase
     ===
     ```
     nowDate.isToday == true
     pastDate.isToday == false
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    /**
     date의 년도를 나타낸다.
     
     How
     ===
     date.year
     
     TestCase
     ===
     ```
     date(2021.1.27).year == 2021
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    /**
     date의 월을 나타낸다.
     
     How
     ===
     date.month
     
     TestCase
     ===
     ```
     date(2021.1.27).month == 1
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    /**
     date의 일을 나타낸다.
     
     How
     ===
     date.day
     
     TestCase
     ===
     ```
     date(2021.1.27).day == 27
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    /**
     date의  월의 마지막 날을 나타낸다.
     
     마지막 날을 나타낼 수 없을 경우 nill
     
     How
     ===
     date.lastDayOfMonth
     
     TestCase
     ===
     ```
     Date(year: 2021, month: 2, day: 1).lastDayOfMonth
     Date(year: 2024, month: 2, day: 1).lastDayOfMonth
     Date(year: 2021, month: 12, day: 31).lastDayOfMonth
     ```
     
     Additional Information
     ===
     Added Version : v1.0.1
     
     Author : dvhuni
    */
    var lastDayOfMonth: Int? {
        guard let firstDayFormattedDate = Date(year: self.year, month: self.month, day: 1),
              let calculatedDate = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: firstDayFormattedDate)
        else { return nil }
        return calculatedDate.day
    }
    /**
     Date 를 나타내는 스트링이 사용된 패턴으로 인식되면 Date 형식으로 생성된다.
     
     - Parameter dateString: Date 를 나타내는 스트링
     - Parameter dateFormat: DateFormat이 정의된 enum으로 WPExtension 에 정의됨
     - Returns: dateString이 변환된 Date
     
     How
     ===
     Date("2020-12-07T03:19:09.000Z", dateFormat: .serverDate)
     
     TestCase
     ===
     ```
     Date("2020-12-07T03:19:09.000Z", dateFormat: .serverDate)
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    init?(_ dateString: String?, dateFormat: WPDateFormat) {
        self.init(dateString, dateFormat: dateFormat.rawValue)
    }
    /**
     Date 를 나타내는 스트링이 사용된 DateFormat으로 인식되면 Date 형식으로 생성된다.
     
     - Parameter dateString: Date 를 나타내는 스트링
     - Parameter dateFormat: 스트링을 변환하기 위한 패턴
     - Returns: dateString이 변환된 Date
     
     How
     ===
     Date("2020-12-07", dateFormat: "yyyy-MM-dd")
     
     TestCase
     ===
     ```
     Date("2020-12-07", dateFormat: "yyyy-MM-dd")
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    init?(_ sourceString: String?, dateFormat: String) {
        guard let sourceString = sourceString else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        if let resultDate = dateFormatter.date(from: sourceString) {
            self = resultDate
        } else {
            return nil
        }
    }
    /**
     연 월 일 등등 dateComponent의 조합으로 원하는 날짜를 만드는 initializer
     
     - Parameter yaer: 날짜의 년도
     - Parameter month: 날짜의 월
     - Parameter day: 날짜의 일
     - Parameter hour: 날짜의 시, 기본값은 0이다.
     - Parameter minute: 날짜의 분, 기본값은 0이다.
     - Parameter second: 날짜의 초, 기본값은 0이다.
     - Returns: components들이 조합된 Date
     
     숫자를 직접 만들때 사용이 되며 기본적인 Timezone 은 "UTC"이기 때문에 formattedString 등에서 표현할 때 다른 Timzone 을 사용하지 않도록 유의하자
     
     How
     ===
     Date(year: 2021, month: 1, day: 26, hour: 3, minute: 30)
     
     TestCase
     ===
     ```
     Date(year: 2021, month: 1, day: 26)
     Date(year: 2021, month: 1, day: 26, hour: 3, minute: 30)
     Date(year: 2021, month: 1, day: 26, hour: 3, minute: 30, second: 30)
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    init?(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        let calendar = Calendar.current
        
        var components = calendar.dateComponents([], from: Date())
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        
        if let resultDate = calendar.date(from: components) {
            self = resultDate
        } else {
            return nil
        }
    }
    /**
     Date 를 원하는 형식의 스트링으로 표현하기 위한 메서드
     
     - Parameter dateFormat: DateFormat이 정의된 enum으로 WPExtension 에 정의됨
     - Returns: Date가 포맷화된 스트링
     
     How
     ===
     date.formattedString(.pattern)
     
     TestCase
     ===
     ```
     testDate.formattedString(.dotDate)
     testDate.formattedString(.dotDateUntilMinute)
     testDate.formattedString(.dotDateUntilSecond)
     testDate.formattedString(.dashDate)
     testDate.formattedString(.dashDateUntilMinute)
     testDate.formattedString(.dashDateUntilSecond)
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func formattedString(_ dateFormat: WPDateFormat) -> String {
        formattedString(dateFormat.rawValue)
    }
    /**
     Date 를 원하는 형식의 스트링으로 표현하기 위한 메서드
     
     - Parameter dateFormat: dateFormat 에 맞는 패턴
     - Returns: Date가 포맷화된 스트링
     
     How
     ===
     date.formattedString("yyyy-MM-dd")
     
     TestCase
     ===
     ```
     testDate.formattedString("yyyy-MM-dd")
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func formattedString(_ dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
