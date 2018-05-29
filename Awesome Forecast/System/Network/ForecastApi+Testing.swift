//
//  ForecastApi+Testing.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 26/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Moya

extension ForecastApi {
    
    var sampleData: Data {
        switch self {
        case .current: return stubbedResponse("Current")
        case .weekly: return stubbedResponse("Weekly")
        }
    }
    
}

func stubbedResponse(_ filename: String) -> Data! {
    @objc class TestClass: NSObject {}
    
    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
    return try! Data(contentsOf: URL(fileURLWithPath: path!))
}
