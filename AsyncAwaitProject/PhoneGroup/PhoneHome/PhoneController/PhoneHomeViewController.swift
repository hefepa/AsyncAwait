//
//  PhoneHomeViewController.swift
//  AsyncAwaitProject
//
//  Created by WEMA on 17/01/2024.
//

import UIKit

class PhoneHomeViewController: UIViewController {
    var data: [PhoneProperties]?
    var phoneModel: PhoneModel?
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.register(UINib(nibName: "PhoneTableViewCell", bundle: nil), forCellReuseIdentifier: "PhoneTableViewCell")
        Task{
            await fetchPhones()
        }
    }
    
    func fetchPhones() async {
        let networkCall = NetworkCall()
        do {
            phoneModel = try await networkCall.fetch(url: URL(string: "https://dummyjson.com/products")!)
            print("output is \(phoneModel)")
            
            //DispatchQueue.main.async { [weak self] in
                self.data = self.phoneModel?.products
                self.myTableView.reloadData()
            //}
        }

        catch (let error){
            print(error.localizedDescription)
        }
    }
}


extension PhoneHomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneTableViewCell", for: indexPath) as! PhoneTableViewCell
        let phoneProperties = data?[indexPath.item]
        cell.updateCell(with: phoneProperties)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
    
