//
//  DDEventIntegrationTests.swift
//  Digitat14DemoTests
//
//  Created by Dattatray Deokar on 09/08/21.
//

import XCTest
@testable import Digitat14Demo


class DDEventIntegrationTests: XCTestCase {
    
    override func tearDown() {
        SceneBuilder.reset()
        super.tearDown()
    }
    
    func testEventListTitle() throws {
        let events = try SceneBuilder().build().events()
        XCTAssertEqual(events.title, DDTableViewController.title)
    }
    

    func testEventListCanRefreshData() throws {
        let refreshedCard = aEvent(id: 1, title: "Refresh Event 1", displayLocation: "Refresh Location 1", timeStamp: "Mon, 21/02/ 2021, 11:44 AM", imageUrl: "https://seatgeek.com/images/performers-landscape/aussie-heat-5d3daf/387794/huge.jpg", isFavourite: true)
        
        let events = try SceneBuilder()
            .build(seatGeekAPI: .results([
                .success([]),
                .success([refreshedCard])
            ]))
            .events()
        
        XCTAssertEqual(events.numberOfEvents(), 0, "events count before refreshing")
        
        events.simulateRefresh()
        
        XCTAssertEqual(events.numberOfEvents(), 1, "events count after refreshing")
        XCTAssertEqual(events.eventName(at: 0), refreshedCard.title, "refreshed event name at row 0")
        XCTAssertEqual(events.eventTime(at: 0), refreshedCard.datetimeLocal, "refreshed event time at row 0")
        XCTAssertEqual(events.eventAddress(at: 0), refreshedCard.venue?.displayLocation, "refreshed event location at row 0")

    }
    
    func testEventList() throws {
        
        let event1 = aEvent(id: 1, title: "Event 1", displayLocation: "Location 1", timeStamp: "Mon, 21/02/ 2021, 11:44 AM", imageUrl: "https://seatgeek.com/images/performers-landscape/aussie-heat-5d3daf/387794/huge.jpg", isFavourite: true)
        let event2 = aEvent(id: 2, title: "Event 2", displayLocation: "Location 2", timeStamp: "Mon, 21/02/ 2021, 11:44 AM", imageUrl: "https://seatgeek.com/images/performers-landscape/magic-mike-live-tour-c66455/152397/huge.jpg", isFavourite: true)
        
        let events = try SceneBuilder()
            .build(seatGeekAPI: .once([event1,event2]))
            .events()

        
        events.selectEvent(at: 0)
        XCTAssertTrue(events.isShowingDetails(for: event1), "should show event details at row 0")
        
        events.selectEvent(at: 1)
        XCTAssertTrue(events.isShowingDetails(for: event2), "should show event details at row 1")
    }

    func testEventListFailure() throws {
        
        let event1 = aEvent(id: 1, title: "Event 1", displayLocation: "Location 1", timeStamp: "Mon, 21/02/ 2021, 11:44 AM", imageUrl: "https://seatgeek.com/images/performers-landscape/aussie-heat-5d3daf/387794/huge.jpg", isFavourite: true)
        let event2 = aEvent(id: 2, title: "Event 2", displayLocation: "Location 2", timeStamp: "Mon, 21/02/ 2021, 11:44 AM", imageUrl: "https://seatgeek.com/images/performers-landscape/magic-mike-live-tour-c66455/152397/huge.jpg", isFavourite: true)
        
        let events = try SceneBuilder()
            .build(seatGeekAPI: .results([.failure(anError()),
                                          .failure(anError()),
                                          .failure(anError())]))
            .events()

        
        events.selectEvent(at: 0)
        XCTAssertFalse(events.isShowingDetails(for: event1), "should fail")
        
        events.selectEvent(at: 1)
        XCTAssertFalse(events.isShowingDetails(for: event2), "should fail")
    }
    
}

private extension UINavigationController {

    func events() throws -> DDTableViewController {
        let vc = try XCTUnwrap(self.viewControllers.first as? DDTableViewController, "couldn't find event list")
        vc.triggerLifecycleIfNeeded()
        return vc
    }
}


private extension DDTableViewController {
    func numberOfEvents() -> Int {
        numberOfRows(atSection: eventSection)
    }
    
    func eventName(at row: Int) -> String? {
        name(at: IndexPath(row: row, section: eventSection))
    }
    
    func eventAddress(at row: Int) -> String? {
        address(at: IndexPath(row: row, section: eventSection))
    }
    
    func eventTime(at row: Int) -> String? {
        timestamp(at: IndexPath(row: row, section: eventSection))
    }
    
    func selectEvent(at row: Int) {
        select(at: IndexPath(row: row, section: eventSection))
        RunLoop.current.run(until: Date())
    }
    
    func isShowingDetails(for item: DDEvent) -> Bool {
        let vc = navigationController?.topViewController as? DDDetailViewController
        return vc?.item?.id == item.id
    }
        
    private var eventSection: Int { 0 }
}
