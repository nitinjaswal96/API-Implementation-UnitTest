//
//  Api_UnitTest_SampleTests.swift
//  Api-UnitTest-SampleTests
//
//  Created by Nitin Jaswal on 2023-03-22.
//

import XCTest
@testable import Api_UnitTest_Sample

class Api_UnitTest_SampleTests: XCTestCase {
    let service = APIServiceBackend()
    let loginRequest = LoginViewAPI(userEmail: "sample@gmail.com", userPassword: "sample*pswd0")
    let expectation = XCTestExpectation(description: "APIResponse_View")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPostLoginAPI_Response() {
        // before testing make sure to check baseURL
        service.send(request: loginRequest) { [weak self] (data: LoginModal?, error: APIError?) in
            /** apply breakpoint to confirm test*/
            guard let `self` = self else { return }
            if let error = error  {
                debugPrint(error.localizedDescription)
            } else if let data = data {
                debugPrint(data)
                XCTAssertNotNil(data)
            }
            self.expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
    }
    
    func testGetUserAPI_Response() {
        // before testing make sure to check baseURL
        service.sendRequest(request: UsersAPI()) { [weak self] (data: [SampleModal2]?, error: APIError?) in
            /** apply breakpoint to confirm test*/
            guard let `self` = self else { return }
            if let error = error  {
                debugPrint(error.errorDescription ?? "")
            } else if let data = data {
                debugPrint(data)
                XCTAssertNotNil(data)
            }
            self.expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
    }
    
    func testLocalAPI_Response() {
        service.sendLocalRequest(request: LocalAPI()) {  (data: LocalFileModal1_1?, error: APIError?) in
            if let error = error  {
                debugPrint(error.errorDescription ?? "")
            } else if let data = data {
                debugPrint(data)
                XCTAssertNotNil(data)
                
                var value: String
                guard data.suggestions.count > 0 else { return }
                let suggestion = data.suggestions[0]
                switch suggestion {
                case .widget(let widgetSugg):
                    let type = widgetSugg.type
                    if type == .widget {
                        value = widgetSugg.value
                        XCTAssertEqual(value, "microwave oven")
                    }
                default:
                    print("....")
                }
            }
        }
    }
}
