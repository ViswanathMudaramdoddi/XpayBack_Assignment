//
//  ViewController.swift
//  XpayBack_Assignment
//
//  Created by Viswanath on 04/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let parser = Parser()
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        parser.fetchData { [weak self] result in
            print(result)
            self?.users = result
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersTableViewCell
       
        cell.userIdLbl.text = "IdNumber: \(users[indexPath.row].id)"
        cell.userFullNameLbl.text = "Name: \(users[indexPath.row].firstName)" + " " + users[indexPath.row].lastName
        cell.userAgeLbl.text = "Age: \(users[indexPath.row].age) years"
        cell.userGenderLblLbl.text = "Gender: \(users[indexPath.row].gender)"
        
        let url = URL(string: users[indexPath.row].image)
        URLSession.shared.dataTask(with: url!) { (data, urlResponse, error) in
            if let data = data {
                DispatchQueue.main.async {
                    cell.userImg.image = UIImage(data: data)
                }
                
            }
        }.resume()


        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == users.count - 1{
            users.append(contentsOf: users)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "userDetails") as? UserDetailsViewController
        
        controller?.userArray = users[indexPath.row].image
        
        controller?.idName = "\(users[indexPath.row].id)" + ". " + users[indexPath.row].firstName + " " + users[indexPath.row].lastName
        controller?.genderAge =  users[indexPath.row].gender + ", " + "\(users[indexPath.row].age) years"
        controller?.email =  " email: \(users[indexPath.row].email)"
        controller?.phoneNumber = " phone No: \(users[indexPath.row].phone)"
        controller?.userName = "UserName: \(users[indexPath.row].username)"
        controller?.userPassword = "UserPassword: \(users[indexPath.row].password)"
        controller?.address = "Address: \(users[indexPath.row].address.address)"
        controller?.city = "City: \(users[indexPath.row].address.city)"
        controller?.stateAndPostal = "State: \(users[indexPath.row].address.state)" + "-" + users[indexPath.row].address.postalCode
        controller?.cardNumber = "CardNumber: \(users[indexPath.row].bank.cardNumber)"
        controller?.cardtype = "Cardtype: \(users[indexPath.row].bank.cardType)"
        controller?.currency = "Currency: \(users[indexPath.row].bank.currency)"
        controller?.companyName = "CompanyName: \(users[indexPath.row].company.name)"
        controller?.department = "DepartmentName: \(users[indexPath.row].company.department)"
        controller?.proffessionalrole = "Role: \(users[indexPath.row].company.title)"
        controller?.companyAddress = "Address: \(users[indexPath.row].company.address.address)"
        controller?.cCity = "City: \(users[indexPath.row].company.address.city)"
        controller?.cStateAndPostal = "State: \(users[indexPath.row].company.address.state)"  + "-" + users[indexPath.row].company.address.postalCode
        
        self.navigationController?.pushViewController(controller!, animated: true)
    }
}

//"\()"
