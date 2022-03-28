//
//  HomeController.swift
//  UberClone
//
//  Created by user on 28/03/22.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        enableLocationServices(locationManager)
//        signOut()
         
    }
    
    //MARK: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    // MARK: - Helper Functions
    
    
    
    func configureUI() {
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
}


 // MARK: - LocationServices
private extension HomeController {

func enableLocationServices(_ manager: CLLocationManager) {

switch manager.authorizationStatus {

case .notDetermined:

print("DEBUG: Not determined..")

manager.requestWhenInUseAuthorization()

case .restricted:

break

case .denied:

break

case .authorizedAlways:

print("DEBUG: Auth always..")

case .authorizedWhenInUse:

print("DEBUG: Auth when in use..")

@unknown default:

print("DEBUG: unknown default..")
    enableLocationServices(locationManager)
    
        }
    }
}

