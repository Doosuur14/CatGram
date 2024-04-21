//
//  CarListManager.swift
//  ControlworkCorrection
//
//  Created by Faki Doosuur Doris on 17.10.2023.
//

import Foundation
import UIKit

class CarListManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var carModel: CarModel
    init(carModel: CarModel) {
        self.carModel = carModel
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carModel.carDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = carModel.carDataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.reuseidentifier, for: indexPath) as! CarTableViewCell
        
        ///using the closure.
        cell.addButtonTapped = {
            CartModel.cart.append(Car(carModel: car.carModel, carPrice: car.carPrice, carImage: car.carImage))
        }
        cell.configureCell(with: car)
        return cell
    }
}
