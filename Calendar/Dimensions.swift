//
//  Dimensions.swift
//  Calendar
//
//  Created by Michał Wziątek on 30/08/2019.
//  Copyright © 2019 Michał Wziątek. All rights reserved.
//

import UIKit

struct Dimensions {
    static var textDescriptionOriginY: CGFloat = 0
    static var textDescriptionHeight: CGFloat = 0
    static var separatorAspectRatio: CGFloat = 0
    static var imageViewHeight: CGFloat = 0
}

func calculatePageControlTopSpacing() -> CGFloat {
    return Dimensions.imageViewHeight * 0.12
}

func calculateButtonSideSpacing() -> CGFloat {
    return UIScreen.main.bounds.width * 0.258454106
}

func calculateButtonHeight() -> CGFloat {
    return Dimensions.imageViewHeight * 0.2
}

func calculateButtonTopSpacing() -> CGFloat {
    return Dimensions.textDescriptionOriginY + Dimensions.textDescriptionHeight + Dimensions.separatorAspectRatio
}

