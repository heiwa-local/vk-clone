//
//  FeedViewController.swift
//  vk-clone
//
//  Created by kunari on 06.08.2022.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.getPost(id: "post1", imageID: "photo-1522252234503-e356532cafd5") {res1 in
            self.posts.append(res1!)
            APIManager.shared.getPost(id: "post2", imageID: "photo-1617042375876-a13e36732a04") {res2 in
                self.posts.append(res2!)
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.postName.text = posts[indexPath.row].name
        cell.postDate.text = posts[indexPath.row].date
        cell.postText.text = posts[indexPath.row].text
        cell.postImage.image = posts[indexPath.row].image
        return cell
    }
    
}
