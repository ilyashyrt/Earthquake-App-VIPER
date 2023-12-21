//
//  Earthquake_AppTests.swift
//  Earthquake AppTests
//
//  Created by Ilyas on 12.09.2023.
//

import XCTest
@testable import Earthquake_App

final class Earthquake_AppTests: XCTestCase {
    
    func testFormatDate() throws {
        let date = "2023.09.12 08:36:18"
        let formattedDate = DateFormatterHelper.formatDate(date)
        let formattedDateString = "12 Eylül 2023, 08:36"
        
        XCTAssertNotEqual(date, formattedDate)
        XCTAssertEqual(formattedDate, formattedDateString)
    }
    
    func testApiUrl() throws {
        let apiUrl = "https://api.orhanaydogdu.com.tr/deprem/kandilli/live"
        
        XCTAssertEqual(apiUrl, AppConstants.apiUrl)
    }
    
    func testApiService_whenSuccess_fetchData() throws {
        
    }
    
    
    
}
