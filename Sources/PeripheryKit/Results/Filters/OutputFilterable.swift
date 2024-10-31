//
//  File.swift
//  
//
//  Created by Tuan Hoang Anh on 31/10/24.
//

import Foundation
import Shared

public protocol OutputFilterable {
    func filter(_ declarations: [ScanResult]) -> [ScanResult]
}

public protocol DiffProviderFactoryProtocol {
    static func makeDiffProvider(
        configuration: Configuration,
        shell: Shell,
        baseline: Baseline?,
        logger: Logger
    ) -> [OutputFilterable]
}

public enum DiffProviderFactory: DiffProviderFactoryProtocol {
    public static func makeDiffProvider(
        configuration: Configuration,
        shell: Shell,
        baseline: Baseline?,
        logger: Logger
    ) -> [OutputFilterable] {
        let contextualLogger = logger.contextualized(with: "report:filter")
        var diffProviders: [OutputFilterable] = []

        if let sourceBranch = configuration.sourceBranch {
            diffProviders.append(SourceBranchFilter(
                sourceBranch: sourceBranch,
                shell: shell,
                contextualLogger: contextualLogger
            ))
        }

        diffProviders.append(
            BaselineFilter(
                configuration: configuration,
                baseline: baseline,
                logger: logger,
                contextualLogger: contextualLogger
            )
        )

        return diffProviders
    }
}
