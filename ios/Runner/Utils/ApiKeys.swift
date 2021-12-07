//
//  ApiKeys.swift
//  Runner
//
//  Created by Jan Kollert on 07/12/2021.
//

import Foundation

/// Defines a serializable data structure we will use for loading from the "apikeys.json" bundle file.
struct ApiKeys: Codable
{
    var googleMapsApiKey: String?
}
