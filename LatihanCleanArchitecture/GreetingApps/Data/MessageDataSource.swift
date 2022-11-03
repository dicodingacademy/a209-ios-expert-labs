//
//  MessageDataSource.swift
//  GreetingApps
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import Foundation

class MessageDataSource: MessageDataSourceProtocol {

  func getMessageFromSource(name: String) -> MessageEntity {
    return MessageEntity(
      welcomeMessage: "Hello \(name) Welcome to Clean Architecture"
    )
  }

}
