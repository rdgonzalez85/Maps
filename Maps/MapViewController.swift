//
//  MapViewController.swift
//  places
//
//  Created by Rodrigo Gonzalez on 5/7/16.
//  Copyright © 2016 Rodrigo Gonzalez. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet weak var bottomBar: UIToolbar!
    
    private var searchController : UISearchController = ( {
        let controller = UISearchController(searchResultsController: nil)
        controller.dimsBackgroundDuringPresentation = false
        controller.hidesNavigationBarDuringPresentation = false
        controller.searchBar.searchBarStyle = .Minimal
        return controller
    })()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: "leftButtonAction")
        setupMapView()
        setupSearchView()
        setupBottomBar()
    }
    
    func setupBottomBar() {
    }
    
    func setupSearchView() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
    }
    
    func leftButtonAction() {
        
    }
    
    func setupMapView() {
        let camera = GMSCameraPosition.cameraWithLatitude(-33.86,
            longitude: 151.20, zoom: 6)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        
        var mapFrame = view.frame
        mapFrame.size.height -= bottomBar.frame.height
        mapView.frame = mapFrame
        self.view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
    // MARK: - Search Actions
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
//        if let searchText = contactsSearchController.searchBar.text where searchController.active && searchText.characters.count > 0 {
//            filteredContacts = contacts.filter({(item: Contact) -> Bool in
//                let contactMatch = item.displayName().lowercaseString.rangeOfString(searchText.lowercaseString)
//                return contactMatch != nil ? true : false
//            })
//        } else {
//            filteredContacts = contacts
//        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
//        dispatch_async(dispatch_get_main_queue(), {
//            self.tableView.reloadData()
//        })
    }
}

