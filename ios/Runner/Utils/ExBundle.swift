//
//  ExBundle.swift
//  Runner
//
//  Created by Jan Kollert on 07/12/2021.
//

import Foundation

/// Extended information for errors thrown from the Bundle.decode(...) extension method.
struct JSONDecoderError : Error
{
    enum ErrorType
    {
        case fileNotFound
        case fileLoadFailed
        case missingKey
        case typeMismatch
        case missingTypeValue
        case invalidJSON
        case decodeFailure
    }
    
    let errorType: ErrorType
    let message: String
}

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type,
                              from file: String,
                              dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                              keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) throws -> T
    {
        guard let url = self.url(forResource: file, withExtension: nil) else
        {
            throw JSONDecoderError(errorType: .fileNotFound, message: "Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else
        {
            throw JSONDecoderError(errorType: .fileLoadFailed, message: "Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do
        {
            return try decoder.decode(T.self, from: data)
        }
        catch DecodingError.keyNotFound(let key, let context)
        {
            throw JSONDecoderError(errorType: .missingKey, message: "Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        }
        catch DecodingError.typeMismatch(_, let context)
        {
            throw JSONDecoderError(errorType: .typeMismatch, message: "Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        }
        catch DecodingError.valueNotFound(let type, let context)
        {
            throw JSONDecoderError(errorType: .missingTypeValue, message: "Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        }
        catch DecodingError.dataCorrupted(_)
        {
            throw JSONDecoderError(errorType: .invalidJSON, message: "Failed to decode \(file) from bundle because it appears to be invalid JSON")
        }
        catch
        {
            throw JSONDecoderError(errorType: .decodeFailure, message: "Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
