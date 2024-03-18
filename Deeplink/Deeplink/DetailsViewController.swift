//
//  DetailsViewController.swift
//  Deeplink
//
//  Created by Nikola Ilic on 18.3.24..
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchJobs()
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    private let viewModel = DetailsJobsViewModel()
    
    
    var jobPosition: JobPosition?
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var positionName: UILabel!
    
    
    @IBOutlet weak var salaryLbl: UILabel!
    
    @IBOutlet weak var tehnologiesLbl: UILabel!
    
    @IBOutlet weak var jobDescription: UITextView!
    
    
    @IBOutlet weak var companyDetails: UITextView!
    
    @IBAction func shareButton(_ sender: Any) {
        share ()
    }
    
    func share() {
        guard let job = jobPosition else { return }
        
        // Kreiranje stringa sa podacima o poslu koji će biti podeljen
        let shareText = "Pozicija: \(job.naziv)\nPlata: \(job.plata)\nTehnologije: \(job.tehnologije.joined(separator: ", "))\nOpis: \(job.opisPozicije)\nOpis firme: \(job.opisFirme)"
        
        // Kreiranje aktivnosti za deljenje
        let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        
        // Prikazivanje dijaloga za deljenje
        present(activityViewController, animated: true, completion: nil)
    }
    
    func updateUI() {
            guard let job = jobPosition else { return }
            
            positionName.text = job.naziv
            salaryLbl.text = job.plata
            var techText = ""
            job.tehnologije.forEach { tech in
                techText += tech + "\n"
            }
            tehnologiesLbl.text = techText
            jobDescription.text = job.opisPozicije
            companyDetails.text = job.opisFirme
            
            if let imageUrl = URL(string: job.slika) {
                detailImage.kf.setImage(with: imageUrl)
            }
        }
    
    
    
    }
    

    
    
    extension DetailsViewController: DetailsJobsViewModelDelegate {
        func detailJobListViewModelDidFetchJobs(_ job: JobPosition) {
            jobPosition = job
            updateUI()
        }
    
    
    
    
}
