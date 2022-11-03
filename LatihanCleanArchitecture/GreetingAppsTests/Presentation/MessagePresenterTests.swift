//
//  MessagePresenterTests.swift
//  GreetingAppsTests
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import XCTest

@testable import GreetingApps
class MessagePresenterTests: XCTestCase {

  static var input: String = "Dicoding"
  static var messageEntitiy = MessageEntity(
    welcomeMessage: "Hello \(input) Welcome to Clean Architecture"
  )

  func testGetDataFromUseCase() throws {

    // Given
    let presenter = MessagePresenterMock()

    // When
    let result = presenter.getMessage(name: MessagePresenterTests.input)
    XCTAssert(presenter.verify())

    // Then
    XCTAssert(
      result.welcomeMessage.contains(
        MessagePresenterTests.messageEntitiy.welcomeMessage
      )
    )

  }

}

extension MessagePresenterTests {

  class MessagePresenterMock: MessagePresenterProtocol {
    var functionWasCalled = false

    func getMessage(name: String) -> MessageEntity {
      functionWasCalled = true
      return messageEntitiy
    }

    func verify() -> Bool {
      return functionWasCalled
    }
  }

}
