//
//  Injection.swift
//  GreetingApps
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import Foundation

final class Injection: NSObject {

  private func provideDataSource() -> MessageDataSourceProtocol {
    return MessageDataSource()
  }

  private func provideRepository() -> MessageRepositoryProtocol {
    let messageDataSource = provideDataSource()
    return MessageRepository(dataSource: messageDataSource)
  }

  func provideUseCase() -> MessageUseCase {
    let messageRepository = provideRepository()
    return MessageInteractor(repository: messageRepository)
  }

}
