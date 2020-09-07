//
//  MessageDataSource.swift
//  GreetingAppsTests
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import XCTest

@testable import GreetingApps
class MessageDataSourceTests: XCTestCase {

  static var input: String = "Dicoding"
  static var messageEntitiy = MessageEntity(
    welcomeMessage: "Hello \(input) Welcome to Clean Architecture"
  )

  func testGetDataFromDataSource() throws {

    // Given
    let dataSource = MessageDataSourceMock()

    // When
    let result = dataSource.getMessageFromSource(name: MessageDataSourceTests.input)
    XCTAssert(dataSource.verify())

    // Then
    XCTAssert(
      result.welcomeMessage.contains(
        result.welcomeMessage
      )
    )

  }

}

extension MessageDataSourceTests {

  class MessageDataSourceMock: MessageDataSourceProtocol {

    var functionWasCalled = false

    func getMessageFromSource(name: String) -> MessageEntity {
      functionWasCalled = true
      return messageEntitiy
    }

    func verify() -> Bool{
      return functionWasCalled
    }
  }

}

