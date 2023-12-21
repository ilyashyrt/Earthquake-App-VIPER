
import XCTest

final class Earthquake_AppUITests: XCTestCase {
    
    
    func testOnTapCellAndNavigationBar() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let firstCell = app.tables.cells.element(matching: .cell, identifier: "Cell_0")
        let backButton = app.navigationBars.firstMatch.buttons.firstMatch
        let cellCount = app.tables.cells.count
        let map = app.maps.firstMatch
        
        
        firstCell.tap()
        
        XCTAssert(backButton.exists)
        XCTAssertEqual(backButton.title, "")
        XCTAssert(map.exists)
        XCTAssert(!firstCell.exists)
        
        backButton.tap()
       
        
        XCTAssert(firstCell.exists)
        XCTAssert(cellCount > 0)
        
    }
    
    
}
