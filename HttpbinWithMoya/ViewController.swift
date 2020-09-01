//
//  ViewController.swift
//  HttpbinWithMoya
//
//  Created by mhlee on 2020/08/31.
//  Copyright © 2020 mhlee. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    view.backgroundColor = .white
    
    log.info("hello world")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let provider = MoyaProvider<HttpbinService>()
    provider.request(.showIp) { result in
      switch result {
      case let .success(response):
        let data = response.data // Data, your JSON response is probably in here!
        let statusCode = response.statusCode // Int - 200, 401, 500, etc
        
        log.info("data: \(String(data: data, encoding: .utf8) ?? "nil")")
        log.info("status code: \(statusCode)")
      // do something in your app
      case let .failure(error):
        log.info("error: \(error)")
        // TODO: handle the error == best. comment. ever.
      }
    }
  }
}
