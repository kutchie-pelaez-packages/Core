import Foundation

extension Date {
    public func componentValue(_ component: Calendar.Component) -> Int {
        Calendar.current.component(component, from: self)
    }

    public func distance(to date: Date, in component: Calendar.Component) -> Int {
        let calendar = Calendar.current
        let toComponent = calendar.component(component, from: date)
        let fromComponent = calendar.component(component, from: self)

        return toComponent - fromComponent
    }

    public func hasSame(_ component: Calendar.Component, as anotherDate: Date) -> Bool {
        distance(to: anotherDate, in: component) == 0
    }
}
