//
//  LocationService.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerInterface {
    var locationManagerDelegate: LocationManagerDelegate? { get set }
    var desiredAccuracy: CLLocationAccuracy { get set }
    func requestLocation()
    func requestWhenInUseAuthorization()
    
}
protocol LocationManagerDelegate: class {
    func locationManager(_ manager: LocationManagerInterface, didUpdateLocations locations: [CLLocation])
    func locationManager(_ manager: LocationManagerInterface, didChangeAuthorization status: CLAuthorizationStatus)
}
class LocationService : NSObject{
//    weak var delegate :
    var locationManager : LocationManagerInterface?
    init(locationManager: LocationManagerInterface = CLLocationManager()) {
        self.locationManager = locationManager
        super.init()
        self.locationManager?.desiredAccuracy  =  kCLLocationAccuracyBest
        self.locationManager?.locationManagerDelegate = self
    }
}

extension CLLocationManager: LocationManagerInterface {
    var locationManagerDelegate: LocationManagerDelegate? {
        get { return delegate as! LocationManagerDelegate? }
        set { delegate = newValue as! CLLocationManagerDelegate? }

    }
    
}


extension LocationService: LocationManagerDelegate {
    func locationManager(_ manager: LocationManagerInterface, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    func locationManager(_ manager: LocationManagerInterface, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager(manager, didUpdateLocations: locations)
    }
    
}

