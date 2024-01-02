//
//  BaseResponse.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 29.12.2023.
//

public struct BaseResponse<T: Decodable>: Decodable {
    
    public let data: T
}
