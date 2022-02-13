//
//  extension+String.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/13.
//

import Foundation

extension String {
    func removeBandSlashB() -> String {
        let removeBString = self.components(separatedBy: "<b>").joined()
        return removeBString.components(separatedBy: "</b>").joined()
    }
}
