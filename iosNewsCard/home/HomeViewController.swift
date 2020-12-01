//
//  HomeViewController.swift
//  iosNewsCard
//
//  Created by Rujun Yao on 10/23/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    let homeViewModel = HomeViewModel(repository: HomeRepository())

    override func viewDidLoad() {
        super.viewDidLoad()
        print("loading")
        loadNews()
        

        // Do any additional setup after loading the view.
    }
    
    func loadNews() {
        
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
            
            print(json.status)
            print(json.totalResults)
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

}
