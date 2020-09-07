//
//  MessageInteractor.swift
//  GreetingApps
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import Foundation

class MessageInteractor: MessageUseCase {
  private let messageRepository: MessageRepositoryProtocol

  init(repository: MessageRepositoryProtocol) {
    self.messageRepository = repository
  }

  func getMessage(name: String) -> MessageEntity {
    return messageRepository.getWelcomeMessage(name: name)
  }
}
