//
//  BundleExtension.swift
//  Nooro
//
//  Created by Done Santana on 1/29/25.
//

import UIKit

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could no find \(file) in the project!")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not lead \(file) in the project!")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project!")
        }
        
        return loadedData
    }
}
