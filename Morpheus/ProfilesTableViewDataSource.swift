//
//  ProfilesTableViewDataSource.swift
//  Morpheus
//
//  Created by Luis Resende on 10/12/2020.
//

import UIKit

class ProfilesTableViewDataSource: NSObject, UITableViewDataSource {
    
    var profiles: [Profile]? = nil

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profiles?.count ?? 0
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
        
        cell.isTopRated = indexPath.row == 0
        cell.profile = self.profiles?[indexPath.row]
        
        return cell
      }
}
