//
//  MainPresenter.swift
//  GreetingApps
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import Foundation

class MessagePresenter: MessagePresenterProtocol {

  private let messageUseCase: MessageUseCase

  init(useCase: MessageUseCase) {
    self.messageUseCase = useCase
  }

  func getMessage(name: String) -> MessageEntity {
    return messageUseCase.getMessage(name: name)
  }
}
