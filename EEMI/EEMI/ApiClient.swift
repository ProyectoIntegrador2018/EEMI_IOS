//
//  ApiClient.swift
//  EEMI
//
//  Created by Jorge Elizondo on 2/17/19.
//  Copyright © 2019 Io Labs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum Result<T> {
    case success(T)
    case error(String)
}

let URL = "http://emmiapi.azurewebsites.net/api"

class ApiClient {

    static let shared = ApiClient()

    private init() {}

    func getToken(username: String, password: String, completion: @escaping (Result<String>) -> Void ) {

        var loginUrl = "\(URL)/Token?username=\(username)&password=\(password)"
        loginUrl = loginUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        Alamofire.request(loginUrl).responseJSON { response in
            switch response.result {
            case .success:
                let data = response.data
                let json = try? JSON(data: data!)
                let token = json?["access_token"].stringValue
                completion(.success(token!))
            case .failure(let error):
                completion(.error(error.localizedDescription))
            }
        }
    }

    func getAppointments (dateInterval: DateInterval, completion: @escaping (Result<[Appointment]>) -> Void ) {
        let startDate = dateInterval.start.toString()
        let endDate = dateInterval.end.toString()

        let appointmentUrl = "\(URL)/Agenda/GetByDate/\(startDate)/\(endDate)"
        let token = User.shared.token!
        let headers: HTTPHeaders = [
            "Authorization": ("Bearer " + token),
            "Accept": "application/json"
        ]

        Alamofire.request(appointmentUrl, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                var appointments = [Appointment]()
                let json = JSON(value)
                
                guard let jsonAppointments = json.array else {
                    return completion(.success(appointments))
                }

                for jsonAppointment in jsonAppointments {
                    let appointment = Appointment(json: jsonAppointment)
                    appointments.append(appointment)
                }
                completion(.success(appointments))
            
            case .failure(let error):
                completion(.error(error.localizedDescription))
            }
        }
    }
}
