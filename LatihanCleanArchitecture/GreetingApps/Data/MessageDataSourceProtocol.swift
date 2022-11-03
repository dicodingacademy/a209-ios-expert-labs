//
//  IMessageDataSource.swift
//  GreetingApps
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import Foundation

protocol MessageDataSourceProtocol {

  func getMessageFromSource(name: String) -> MessageEntity

}
