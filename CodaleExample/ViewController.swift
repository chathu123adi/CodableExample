//
//  ViewController.swift
//  CodaleExample
//
//  Created by vinoj randika on 2023-04-27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // encode data
        let encoder = JSONEncoder()
        
        // decode data
        let decoder = JSONDecoder()
        
        let cat = Animal(id: 1, name: "Cat")
        let dog = Animal(id: 1, name: "Dog")
        let lion = Animal(id: 1, name: "Lion")
        
        if let data = try? encoder.encode(cat) {
            print(data)
            
            if let jsondata = try? decoder.decode(Animal.self, from: data) {
                print(jsondata)
            }
            
        }
        
        var apiUrl = "https://59b8726e92ccc3eb44b0c193eeef96f6.m.pipedream.net/products"
        
        var url = URL(string: apiUrl)!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            print(data)
            
            if let productdata = try? decoder.decode([product].self, from: data!) {
                print(productdata)
                
                print(productdata[0].title)
            }
        }
        
        task.resume()
        
        
        
    }
}

struct product: Codable {
    var id: String
    var title: String
    var price: String
    var rating: Double
    var description: String
    var images: String
}


struct Animal: Codable {
    var id: Int
    var name: String
}

