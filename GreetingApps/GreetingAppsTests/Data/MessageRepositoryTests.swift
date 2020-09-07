//
//  MessageRepositoryTests.swift
//  GreetingAppsTests
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import XCTest

@testable import GreetingApps
class MessageRepositoryTests: XCTestCase {

  static var input: String = "Dicoding"
  static var messageEntitiy = MessageEntity(
    welcomeMessage: "Hello \(input) Welcome to Clean Architecture"
  )

  func testGetDataFromRepository() throws {

    // Given
    let repository = MessageRepositoryMock()

    // When
    let result = repository.getWelcomeMessage(name: MessageRepositoryTests.input)
    XCTAssert(repository.verify())

    // Then
    XCTAssert(
      result.welcomeMessage.contains(
        result.welcomeMessage
      )
    )

  }

}

extension MessageRepositoryTests {

  class MessageRepositoryMock: MessageRepositoryProtocol {

    var functionWasCalled = false

    func getWelcomeMessage(name: String) -> MessageEntity {
      functionWasCalled = true
      return messageEntitiy
    }

    func verify() -> Bool{
      return functionWasCalled
    }
  }

}
