//
//  ViewController.swift
//  Deeplink
//
//  Created by Nikola Ilic on 18.3.24..
//

import UIKit
import Kingfisher

class JobListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = JobListViewModel()
    
    var dataSource: [JobPosition] = []
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.dataSource = self
            tableView.delegate = self
            viewModel.delegate = self
            viewModel.fetchJobs()
        }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OpenPositionsTableViewCell
            let job = dataSource[indexPath.row]
            
            cell.positionNameLbl.text = job.naziv
            cell.salaryLbl.text = job.plata
            
            if let imageURL = URL(string: job.slika) {
                cell.positionImage.kf.setImage(with: imageURL)
            }
            
            return cell
        }
        

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedJob = dataSource[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        vc.jobPosition = selectedJob 
        navigationController?.pushViewController(vc, animated: true)
    }

    
        
    
 }

// MAKR: - JobListViewModelDelegate
extension JobListViewController: JobListViewModelDelegate {
    func jobListViewModelDidFetchJobs(_ job: JobPositionsResponse) {
        dataSource = job.pozicije
        tableView.reloadData()
    }
    
}


//U nativnom iOS Frameworku koristeci Swift programski jezik napraviti aplikaciju.
//Aplikacija se sastoji od sledecih ekrana:
//*  ------Lista otvorenih pozicija. Svaki element liste ima: sliku, naziv pozicije i rang plate.
//*   ---------- Detalji pozicije. Ekran je skrolabilan i sadrži sliku, naziv pozicije, rang plate, spisak tehnologija, text opisa pozicije i text opisa kompanije i share dugme.



//Deeplinking:
//Share dugme na ekranu “Detalji pozicije” treba da kreira Branch.io link za tu poziciju i da omogući share samog linka koristeći defaultni share dialog (Share activity)
//Koristeci Branch.io library omoguciti da se klikom na link otvori diretkno ekran “Detalji pozicije”, bez obzira da li je aplikacija zatvorena, u pozadini ili je otvorena.
//Arhitektura aplikacije:
//* ------------------Svaki view controller treba da ima svoj ViewModel
//Podaci u aplikaciji:
//* ---------------Koristeći: Alamofire obezbediti da se podaci prikupljaju sa mokovanog online API servera (recimo: https://mockbin.io/). Strukturu response-a ostavljamo kanidatu da osmisli.
