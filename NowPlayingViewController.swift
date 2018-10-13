//
//  NowPlayingViewController.swift
//  filx_demo
//
//  Created by jojo on 2018/10/13.
//  Copyright © 2018年 Blair. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    @IBOutlet weak var tableview:
    UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                let movies = dataDictionary["results"] as! [[String: Any]]
                for movie in movies{
                    let title = movie["title"] as! String
                    print(title)
                }
            }
        }
        task.resume()
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        
        //func tableView(<#T##tableView: UITableView##UITableView#>, cellForRowAt: <#T##IndexPath#>)-> UITableViewCell{
          //  let cell = tableview.dequeueReusableCell(withIdentifier: "MovieCell", for: <#T##IndexPath#>)
            //return cell
        
        //}
        //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //    let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
       //     cell.textLabel?.text = data[indexPath.row]
       //     return cell
      //  }
        
        
        
}
}
}
