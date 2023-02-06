//
//  UserDetailsViewController.swift
//  XpayBack_Assignment
//
//  Created by Viswanath on 05/02/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var userArray = ""
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var idNameLabel: UILabel!
    @IBOutlet weak var genderAgeLabel: UILabel!
    
    @IBOutlet weak var contactTitleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumbLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPasswordLabel: UILabel!
    
    @IBOutlet weak var residentialTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var statePostalCodeLabel: UILabel!
    
    @IBOutlet weak var bankTitleLabel: UILabel!
    @IBOutlet weak var cardNumbLabel: UILabel!
    @IBOutlet weak var cardTypeLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var CompanyAddTitleLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var proffessionalRoleLabel: UILabel!
    @IBOutlet weak var companyAddressLabel: UILabel!
    @IBOutlet weak var cCityLabel: UILabel!
    @IBOutlet weak var cStatePostalcodeLabel: UILabel!
    
    var idName = ""
    var genderAge = ""
    
    var email = ""
    var phoneNumber = ""
    var userName = ""
    var userPassword = ""
    
    var address = ""
    var city = ""
    var stateAndPostal = ""
    
    var cardNumber = ""
    var cardtype = ""
    var currency = ""
    
    var companyName = ""
    var department = ""
    var proffessionalrole = ""
    var companyAddress = ""
    var cCity = ""
    var cStateAndPostal = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "User Details"
        self.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 200)
        scrollView.isScrollEnabled = true
       
        userImg.layer.borderWidth = 1
        userImg.layer.borderColor = UIColor.black.cgColor
        userImg.layer.cornerRadius = userImg.frame.size.width / 2
        userImg.clipsToBounds = true
        let url = URL(string: userArray)

        userImg.downloaded(from: url!)
        idNameLabel.text = idName
        genderAgeLabel.text = genderAge
        
        emailLabel.text = email
        phoneNumbLabel.text = phoneNumber
        userNameLabel.text = userName
        userPasswordLabel.text = userPassword
        
        addressLabel.text = address
        cityLabel.text = city
        statePostalCodeLabel.text = stateAndPostal
        
        cardNumbLabel.text = cardNumber
        cardTypeLabel.text = cardtype
        currencyLabel.text = currency
        
        companyNameLabel.text = companyName
        departmentLabel.text = department
        proffessionalRoleLabel.text = proffessionalrole
        companyAddressLabel.text = companyAddress
        cCityLabel.text = cCity
        cStatePostalcodeLabel.text = cStateAndPostal
        
    }
    override func viewDidAppear(_ animated: Bool) {
       scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 300)
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleToFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
