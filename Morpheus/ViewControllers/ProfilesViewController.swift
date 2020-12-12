//
//  ProfilesViewController.swift
//  Morpheus
//
//  Created by Luis Resende on 10/12/2020.
//

import UIKit

class ProfilesViewController: UIViewController
{
    @IBOutlet weak var profilesTableView: UITableView!
    
    var tableViewDatasource: ProfilesTableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTopbar()
        setupTableView()
        loadProfiles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupTopbar() {
        navigationItem.setHidesBackButton(true, animated: false)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: nil, action: nil)
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Logo"))
    }
    
    func setupTableView() {
        tableViewDatasource = ProfilesTableViewDataSource()
        
        profilesTableView.dataSource = tableViewDatasource
    }
    
    func loadProfiles()
    {
        ServiceManager.shared.getProfiles() { result, error  in
            
            if let profiles = result
            {
                self.tableViewDatasource?.profiles = profiles.sorted { $0.starLevel > $1.starLevel }
                DispatchQueue.main.async {
                    self.profilesTableView.reloadData()
                }
            }
            else
            {
                
            }
        }
    }
}
