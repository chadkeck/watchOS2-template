//
//  ComplicationProvider.swift
//  watchOS2-template
//
//  Created by Chad Bibler on 1/3/16.
//  Copyright © 2016 Chad Bibler. All rights reserved.
//

import ClockKit

struct ComplicationProvider {

    init() {

    }

    func getPlaceholderForFamily(family: CLKComplicationFamily) -> CLKComplicationTemplate {
        switch family {
        case .ModularSmall:
            let template = CLKComplicationTemplateModularSmallSimpleText()
            template.textProvider = CLKSimpleTextProvider(text: "A")
            return template

        case .ModularLarge:
            let template = CLKComplicationTemplateModularLargeColumns()
            template.row1Column1TextProvider = CLKSimpleTextProvider(text: "A")
            template.row1Column2TextProvider = CLKSimpleTextProvider(text: "1")
            template.row2Column1TextProvider = CLKSimpleTextProvider(text: "B")
            template.row2Column2TextProvider = CLKSimpleTextProvider(text: "2")
            template.row3Column1TextProvider = CLKSimpleTextProvider(text: "C")
            template.row3Column2TextProvider = CLKSimpleTextProvider(text: "3")
            return template

        case .UtilitarianSmall:
            let template = CLKComplicationTemplateUtilitarianSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "A")
            template.ringStyle = .Closed
            template.fillFraction = 0.0
            return template

        case .UtilitarianLarge:
            let template = CLKComplicationTemplateUtilitarianLargeFlat()
            template.textProvider = CLKSimpleTextProvider(text: "A")
            template.imageProvider = nil
            return template

        case .CircularSmall:
            let template = CLKComplicationTemplateCircularSmallStackText()
            template.line1TextProvider = CLKSimpleTextProvider(text: "A")
            template.line2TextProvider = CLKSimpleTextProvider(text: "1")
            return template
        }
    }

    func getTemplateForFamily(family: CLKComplicationFamily) -> CLKComplicationTemplate {
        switch family {
        case .ModularSmall:
            let template = CLKComplicationTemplateModularSmallSimpleText()
            template.textProvider = CLKSimpleTextProvider(text: "A")
            return template

        case .ModularLarge:
            let template = CLKComplicationTemplateModularLargeColumns()
            template.row1Column1TextProvider = CLKSimpleTextProvider(text: "A")
            template.row1Column2TextProvider = CLKSimpleTextProvider(text: "1")
            template.row2Column1TextProvider = CLKSimpleTextProvider(text: "B")
            template.row2Column2TextProvider = CLKSimpleTextProvider(text: "2")
            template.row3Column1TextProvider = CLKSimpleTextProvider(text: "C")
            template.row3Column2TextProvider = CLKSimpleTextProvider(text: "3")
            return template

        case .UtilitarianSmall:
            let template = CLKComplicationTemplateUtilitarianSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "A")
            template.ringStyle = .Closed
            template.fillFraction = 0.0
            return template

        case .UtilitarianLarge:
            let template = CLKComplicationTemplateUtilitarianLargeFlat()
            template.textProvider = CLKSimpleTextProvider(text: "A")
            template.imageProvider = nil
            return template

        case .CircularSmall:
            let template = CLKComplicationTemplateCircularSmallStackText()
            template.line1TextProvider = CLKSimpleTextProvider(text: "A")
            template.line2TextProvider = CLKSimpleTextProvider(text: "1")
            return template
        }
    }

}
