//
//  ViewController.swift
//  GreetingApps
//
//  Created by Gilang Ramadhan on 07/09/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var welcome: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let usecase = Injection.init().provideUseCase()
    let presenter = MessagePresenter(useCase: usecase)
    let message = presenter.getMessage(name: "Dicoding")

    welcome.text = message.welcomeMessage

  }

}
