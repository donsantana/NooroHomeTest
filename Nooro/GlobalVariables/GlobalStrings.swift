//
//  GlobalStrings.swift
//  Nooro
//
//  Created by Done Santana on 1/29/25.
//

import Foundation

struct GlobalStrings {
    static let invalidUrlMessage: String = NSLocalizedString("Invalid URL",comment:"")
    static let serverErrorMessage: String = NSLocalizedString("Something wrong happend on the server.\n Then try again.",comment:"")
    static let serverResponseMessage: String = NSLocalizedString("Something wrong happend on the server. With status code %@. \n Please try again.",comment:"")
    static let noCitySelectedMessage: String = NSLocalizedString("No City Selected",comment:"")
    static let noCityFoundMessage: String = NSLocalizedString("City not Found",comment:"")
    static let searchCityMessage: String = NSLocalizedString("Please Search For A City",comment:"")
    static let humidityLabel: String = NSLocalizedString("Humidity",comment:"")
    static let uVLabel: String = NSLocalizedString("UV",comment:"")
    static let feelsLikeLabel: String = NSLocalizedString("Feels Like",comment:"")
    static let searchLocationText: String = NSLocalizedString("Search Location",comment:"")
}
