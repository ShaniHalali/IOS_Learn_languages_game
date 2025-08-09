//
//  ResultController.swift
//  PlayWords
//
//  Created by Shani Halali on 31/07/2025.
//

import UIKit

class ReviewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var usersRecordsList: [UserRank] = []
    var user_key: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.register(UINib(nibName: "RankTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "RankTableViewCellID")
        tableView.dataSource = self
        
        user_key = UserDefaults.standard.string(forKey: "user_key")
        print("user_key from preferences: \(user_key!)")
        
        setUserScoreLabel()
        setRecordsTabelView()
        
        
    }
    // MARK: - Navigation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUserScoreLabel()
        setRecordsTabelView()
        
    }
    
    func setRecordsTabelView(){
        FirebaseUsersLeaderboard.shared.fetchUsersRecord { userList in
            print("----user list by highest score-----")
            for user in userList {
                print("Username: \(user.username) Score: \(user.score)")
            }
            
            DispatchQueue.main.async {
                self.usersRecordsList = userList
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    func setUserScoreLabel() {
        FirebaseUserInfo.info.getUserScore(user_key: user_key!){ score in
            if let user_score = score {
                self.scoreLabel.text = "\(user_score)"
                
            } else {
                print("No user_key saved.")
                self.scoreLabel.text = "0"
                
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ReviewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersRecordsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RankTableViewCellID", for: indexPath) as? RankTableViewCell else {
            return UITableViewCell()
        }
        
        let userRecord = usersRecordsList[indexPath.row]
        cell.configure(userRank: userRecord, place: indexPath.row + 1)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ReviewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

}

