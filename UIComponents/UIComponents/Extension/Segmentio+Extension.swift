//
//  Segmentio+Extension.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 28.12.2023.
//

import Segmentio

public extension SegmentioOptions {
    
    static func segmentioOptionsChanged() -> SegmentioOptions {
        
        let indicatorOptions = SegmentioIndicatorOptions(type: .bottom, ratio: 0.40, height: 3, color: .weatherDarkBlue)
        let horizontalSeperatorOptions = SegmentioHorizontalSeparatorOptions(type: .bottom, height: 0, color: .white)
        let verticalSeparatorOptions = SegmentioVerticalSeparatorOptions(ratio: 1, color: .gray)
        
        let segmentStates = SegmentioStates(defaultState: SegmentioState(backgroundColor: .white,
                                                                         titleFont: .font(.nunitoBold, size: .medium),
                                                                         titleTextColor: .gray, titleAlpha: 1),
                                            selectedState: SegmentioState(backgroundColor: .white,
                                                                          titleFont: .font(.nunitoBold, size: .medium),
                                                                          titleTextColor: .weatherDarkBlue,
                                                                          titleAlpha: 1),
                                            highlightedState: SegmentioState(backgroundColor: .white,
                                                                             titleFont: .font(.nunitoBold, size: .medium),
                                                                             titleTextColor: .weatherDarkBlue,
                                                                             titleAlpha: 1))
        
        let  segmentioOptions = SegmentioOptions(backgroundColor: .white,
                                                 segmentPosition: .fixed(maxVisibleItems: 2),
                                                 scrollEnabled: true,
                                                 indicatorOptions:
                                                    indicatorOptions,
                                                 horizontalSeparatorOptions:
                                                    horizontalSeperatorOptions,
                                                 verticalSeparatorOptions:
                                                    verticalSeparatorOptions,
                                                 labelTextAlignment: .center,
                                                 segmentStates:
                                                    segmentStates)
        
        return segmentioOptions
    }
}
