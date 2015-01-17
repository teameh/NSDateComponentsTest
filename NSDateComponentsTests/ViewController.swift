//
//  ViewController.swift
//  NSDateComponentsTests
//
//  Created by Tieme van Veen on 16/01/2015.
//  Copyright (c) 2015 Tieme van Veen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var textView: UITextView!

	func startWithFirstDayOfWeek(startDay : Int?){

		// January 16th 2015 10:20 AM in Amsterdam
		var date = NSDate(timeIntervalSince1970: 1421400000)

		var formatter = NSDateFormatter()
		formatter.dateFormat = "dd-MMM"

		let calendar = NSCalendar.currentCalendar()
		if(startDay != nil && startDay > 0){
			// Start day of the week (1 = sunday, 2 = monday, etc).
			calendar.firstWeekday = startDay!
		}

		var output = logDay(calendar)

		let units = NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.MonthCalendarUnit
			| NSCalendarUnit.WeekOfMonthCalendarUnit | NSCalendarUnit.DayCalendarUnit
			| NSCalendarUnit.WeekdayCalendarUnit

		// Loop days in January
		for day in 1...31 {

			// select day in month
			var components = calendar.components(units, fromDate: date)
			components.day = day

			// get day and components
			let _date = calendar.dateFromComponents(components)!
			var _components = calendar.components(units, fromDate: _date)

			// retrieve characteristics
			var weekOfMonth = _components.weekOfMonth
			var dayOfWeek = _components.weekday
			var month = _components.month
            
			output += "+ \(formatter.stringFromDate(_date)) - is day \(dayOfWeek) of week \(weekOfMonth) of month \(month) \n";
		}

		textView.text = output + "\n\n" + textView.text
		println(output)
	}

	func logDay(calendar: NSCalendar) -> String {
		switch calendar.firstWeekday {
		case 1:
			return "Start on day \(calendar.firstWeekday) (Sunday) \n--------\n"
		case 2:
			return "Start on day \(calendar.firstWeekday) (Monday) \n--------\n"
		default:
			return "Start on day \(calendar.firstWeekday) \n--------\n"
		}
	}

	@IBAction func startSunday(sender: AnyObject) {
		startWithFirstDayOfWeek(1);
	}

	@IBAction func startMonday(sender: AnyObject) {
		startWithFirstDayOfWeek(2);
	}

	@IBAction func startDefault(sender: AnyObject) {
		startWithFirstDayOfWeek(0);
	}
}

