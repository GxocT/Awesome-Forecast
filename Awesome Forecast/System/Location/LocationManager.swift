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
    
    private struct Constants {
        static let logTitle = NSLocalizedString("Log_title.Location", comment: "")
    }
    
    func getCurrentCity(completion: @escaping (ResponseResult<String>) -> ()) {
        guard NetworkManager.isConnectionAvailable else {
            let title = NSLocalizedString("Log_title.Network", comment: "")
            let errorDescription = NSLocalizedString("Error.No_internet_connection", comment: "")
            completion(.error(.network(errorDescription)))
            ConsoleLogger.log(event: .fail, title: title, message: errorDescription)
            return
        }
        
        requestAuthIfNeeded()
        
        if CLLocationManager.locationServicesEnabled() {
            if let currentCity = currentCity {
                completion(.success(currentCity))
            } else {
                currentCityUpdatedCompletion = completion
                manager.requestLocation()
            }
        } else {
            let error = NSLocalizedString("Error.Location_service_disabled", comment: "")
            let details = NSLocalizedString("Error_details.Enable_location_service", comment: "")
            let fullErrorMessage = String(format: "%@\n%@", error, details)
            completion(.error(.network(fullErrorMessage)))
            ConsoleLogger.log(event: .fail, title: Constants.logTitle, message: error)
        }
    }
    
    private var manager: CLLocationManager
    
    private var currentCity: String? {
        didSet {
            if let city = currentCity {
                currentCityUpdatedCompletion?(.success(city))
            } else {
                let errorDescription = NSLocalizedString("Error.Unable_to_get_current_city", comment: "")
                currentCityUpdatedCompletion?(.error(.location(errorDescription)))
                ConsoleLogger.log(event: .fail, title: Constants.logTitle, message: errorDescription)
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
            
            ConsoleLogger.log(event: .success, title: Constants.logTitle, message: placemark.locality)
            self?.currentCity = placemark.locality
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        ConsoleLogger.log(event: .fail, title: Constants.logTitle, message: error.localizedDescription)
        currentCityUpdatedCompletion?(.error(.location(error.localizedDescription)))
    }
}
