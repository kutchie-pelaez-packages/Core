import Foundation

extension Date {
    public func distance(
        to date: Date,
        component: Calendar.Component,
        calendar: Calendar = .current
    ) -> Int {
        let toComponent = calendar.component(
            component,
            from: date
        )
        let fromComponent = calendar.component(
            component,
            from: self
        )

        return toComponent - fromComponent
    }

    public func hasSame(
        _ component: Calendar.Component,
        as date: Date
    ) -> Bool {
        distance(
            to: date,
            component: component
        ) == 0
    }
}
