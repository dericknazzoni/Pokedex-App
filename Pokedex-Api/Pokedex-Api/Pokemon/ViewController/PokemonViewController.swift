//
//  ViewController.swift
//  Pokedex-Api
//
//  Created by Derick Willians Plens Nazzoni on 23/07/19.
//  Copyright © 2019 Derick Willians Plens Nazzoni. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var pokemonTableView: UITableView!
    
    var nomes: Array = ["derick", "breno", "matheus","9","7","5","4","3","2","2"]
    var nomeSelected: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.register(UINib(nibName: "CustomViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setBackground() {
        view.addSubview(pokemonTableView)
        pokemonTableView.translatesAutoresizingMaskIntoConstraints = false
        pokemonTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pokemonTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pokemonTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
    }


}
extension PokemonViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemonSelected = nomes[indexPath.row]
        self.nomeSelected = pokemonSelected
        let testeViewController = DetailViewController()
        testeViewController.pokemonText = pokemonSelected
        self.navigationController?.pushViewController(testeViewController, animated: true)
    }
}

extension PokemonViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell") as? CustomViewCell else { return UITableViewCell() }
        let pokemon = nomes[indexPath.row]
        cell.myLabel.text = pokemon
        return cell
    }
    
    
}
