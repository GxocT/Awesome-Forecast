//
//  LocationManager.swift
//  Awesome Forecast
//
//  Created by Sergey Bendak on 26/05/2018.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

typealias Location = CLLocationCoordinate2D

class LocationManager: NSObject {
    
    static var shared = LocationManager()
    
    func getCurrentCity(completion: @escaping (ResponseResult<String>) -> ()) {
        // TODO: проверять включен ли геосервис
        
        requestAuthIfNeeded()
        
        if let currentCity = currentCity {
            completion(.success(currentCity))
        } else {
            currentCityUpdatedCompletion = completion
            manager.requestLocation()
        }
    }
    
    private var manager: CLLocationManager
    
    private var currentCity: String? {
        didSet {
            if let city = currentCity {
                currentCityUpdatedCompletion?(.success(city))
            } else {
                currentCityUpdatedCompletion?(.error("Unable to get current city."))
            }
        }
    }
    
    private var currentCityUpdatedCompletion: ((ResponseResult<String>) -> ())?
    
    private override init() {
        manager = CLLocationManager()
        super.init()
        
        manager.delegate = self
    }
    
    private func requestAuthIfNeeded() {
        let status = CLLocationManager.authorizationStatus()
        if status != .authorizedAlways || status != .authorizedWhenInUse {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    private func getPlacemark(by location: CLLocation, completion: @escaping (CLPlacemark?) -> ()) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            completion(placemarks?.first)
        }
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        getPlacemark(by: location) { [weak self] (placemark) in
            guard let placemark = placemark else { return }
            
            self?.currentCity = placemark.locality
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        
        currentCityUpdatedCompletion?(.error(error.localizedDescription))
    }
}
