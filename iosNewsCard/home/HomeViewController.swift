//
//  HomeViewController.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/23/20.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    let homeViewModel = HomeViewModel(repository: HomeRepository())
    var news = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("loading")
        loadNews { [weak self] in
            self!.newsTableView!.reloadData()
        }
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    func loadNews(completed: @escaping () -> ()) {
        
        homeViewModel.getNewsListener {
            [weak self] (data, urlResponse, error) in
            guard let self = self else {return}
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            // have data. Currently we only print
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            } catch {
                print("Failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            
            self.news = json.articles
            DispatchQueue.main.async {
                completed()
            }
        
        }
        
        homeViewModel.loadTopNewsFor(country: "us")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = news[indexPath.row].title
        return cell
    }

}
