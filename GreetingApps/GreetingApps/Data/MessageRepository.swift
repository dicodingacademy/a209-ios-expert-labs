//
//  MessageRepository.swift
//  GreetingApps
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import Foundation

class MessageRepository: MessageRepositoryProtocol {
  private let messageDataSource: MessageDataSourceProtocol

  init(dataSource: MessageDataSourceProtocol) {
    self.messageDataSource = dataSource
  }

  func getWelcomeMessage(name: String) -> MessageEntity {
    messageDataSource.getMessageFromSource(name: name)
  }
}
