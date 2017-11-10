//
//  Log.swift
//  LegoTrainingApp
//
//  Created by David Martin on 10/11/17.
//  Copyright © 2017 wtransnet. All rights reserved.
//

import Log

struct Log {
    static let logger = Logger(formatter: .detailed)
    private init() { }
}

extension Formatters {
    static let detailed = Formatter("%@ %@ [%@.%@:%@] --> %@", [
        .date("yyyy-MM-dd HH:mm:ss.SSS"),
        .level,
        .file(fullPath: false, fileExtension: false),
        .function,
        .line,
        .message
        ])
}
