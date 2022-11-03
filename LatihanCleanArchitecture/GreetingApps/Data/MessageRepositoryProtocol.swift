//
//  IMessageRepository.swift
//  GreetingApps
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import Foundation

protocol MessageRepositoryProtocol {
  func getWelcomeMessage(name: String) -> MessageEntity
}
