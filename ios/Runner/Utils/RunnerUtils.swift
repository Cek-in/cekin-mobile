//
//  RunnerUtils.swift
//  Runner
//
//  Created by Jan Kollert on 07/12/2021.
//

import Foundation
import os.log

/// Additional support methods to help with Flutter & iOS integrations.
struct RunnerUtils
{
    ///
    private init()
    {
        
    }
    
    /// Attempts to load the JSON from the Bundle's "apikeys.json" file into the ApiKeys structure.
    static func loadApiKeys() throws -> ApiKeys
    {
        let apiKeys = try Bundle.main.decode(ApiKeys.self, from: "apikeys.json")
        
        if (apiKeys.googleMapsApiKey == nil)
        {
            logFlutterMessage("RunnerUtils.loadApiKeys: Error > apiKeys.googleMapsApiKey == nil")
        }
        else
        {
            if (apiKeys.googleMapsApiKey!.isEmpty)
            {
                logFlutterMessage("RunnerUtils.loadApiKeys: Error > apiKeys.googleMapsApiKey == \"\"")
            }
        }
        
        return apiKeys
    }

    static func logFlutterMessage(_ message: String)
    {
        //#if DEBUG
        os_log("[iOS Log]: %s", message)
        //#endif
    }
}
