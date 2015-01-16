# NSDateComponentsTest
Trying to solve https://github.com/Mozharovsky/CVCalendar/issues/7 .. 

It seems NSDateComponents gives back the wrong day number when the user sets it region to a region with a week starting on monday


	// January 16th 2015 10:20 AM in Amsterdam
	var date = NSDate(timeIntervalSince1970: 1421400000)

	var formatter = NSDateFormatter()
	formatter.dateFormat = "dd-MMM"

	let calendar = NSCalendar.currentCalendar()
	calendar.firstWeekday = 2

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
		let dayWeekOfMonth = _components.weekOfMonth
		let dayOfWeek = _components.weekday
		let month = _components.month

		println("\(formatter.stringFromDate(_date)) is day \(dayOfWeek) of week \(dayWeekOfMonth) of month \(month) \n")
	}

Build and run the app in the simulator
--------

**Sunday Button:**

Start on day 1 (Sunday)  
- 01-Jan is day 5 of week 1 of month 1   
- 02-Jan is day 6 of week 1 of month 1   
- 03-Jan is day 7 of week 1 of month 1   
- 04-Jan is day 1 of week 2 of month 1   
- 05-Jan is day 2 of week 2 of month 1   
- 06-Jan is day 3 of week 2 of month 1   
- 07-Jan is day 4 of week 2 of month 1   
- 08-Jan is day 5 of week 2 of month 1   
- 09-Jan is day 6 of week 2 of month 1   
- 10-Jan is day 7 of week 2 of month 1   
- 11-Jan is day 1 of week 3 of month 1   
- 12-Jan is day 2 of week 3 of month 1   
- 13-Jan is day 3 of week 3 of month 1   
- 14-Jan is day 4 of week 3 of month 1   
- 15-Jan is day 5 of week 3 of month 1   
- 16-Jan is day 6 of week 3 of month 1   
- 17-Jan is day 7 of week 3 of month 1   
- 18-Jan is day 1 of week 4 of month 1   
- 19-Jan is day 2 of week 4 of month 1   
- 20-Jan is day 3 of week 4 of month 1   
- 21-Jan is day 4 of week 4 of month 1   
- 22-Jan is day 5 of week 4 of month 1   
- 23-Jan is day 6 of week 4 of month 1   
- 24-Jan is day 7 of week 4 of month 1   
- 25-Jan is day 1 of week 5 of month 1   
- 26-Jan is day 2 of week 5 of month 1   
- 27-Jan is day 3 of week 5 of month 1   
- 28-Jan is day 4 of week 5 of month 1   
- 29-Jan is day 5 of week 5 of month 1   
- 30-Jan is day 6 of week 5 of month 1   
- 31-Jan is day 7 of week 5 of month 1   

**Monday Button:**

Start on day 2 (Monday)  
- 01-Jan is day <b>5</b> of week 1 of month 1   
- 02-Jan is day <b>6</b> of week 1 of month 1   
- 03-Jan is day <b>7</b> of week 1 of month 1   
- 04-Jan is day <b>1</b> of week 1 of month 1   
- 05-Jan is day <b>2</b> of week 2 of month 1   
- 06-Jan is day <b>3</b> of week 2 of month 1   
- 07-Jan is day <b>4</b> of week 2 of month 1   
- 08-Jan is day <b>5</b> of week 2 of month 1   
- 09-Jan is day <b>6</b> of week 2 of month 1   
- 10-Jan is day <b>7</b> of week 2 of month 1   
- 11-Jan is day <b>1</b> of week 2 of month 1   
- 12-Jan is day <b>2</b> of week 3 of month 1   
- 13-Jan is day <b>3</b> of week 3 of month 1   
- 14-Jan is day <b>4</b> of week 3 of month 1   
- 15-Jan is day <b>5</b> of week 3 of month 1   
- 16-Jan is day <b>6</b> of week 3 of month 1   
- 17-Jan is day <b>7</b> of week 3 of month 1   
- 18-Jan is day <b>1</b> of week 3 of month 1   
- 19-Jan is day <b>2</b> of week 4 of month 1   
- 20-Jan is day <b>3</b> of week 4 of month 1   
- 21-Jan is day <b>4</b> of week 4 of month 1   
- 22-Jan is day <b>5</b> of week 4 of month 1   
- 23-Jan is day <b>6</b> of week 4 of month 1   
- 24-Jan is day <b>7</b> of week 4 of month 1   
- 25-Jan is day <b>1</b> of week 4 of month 1   
- 26-Jan is day <b>2</b> of week 5 of month 1   
- 27-Jan is day <b>3</b> of week 5 of month 1   
- 28-Jan is day <b>4</b> of week 5 of month 1   
- 29-Jan is day <b>5</b> of week 5 of month 1   
- 30-Jan is day <b>6</b> of week 5 of month 1   
- 31-Jan is day <b>7</b> of week 5 of month 1   

**Default button:**

Start on day 1 (Sunday)  
- 01-Jan is day 5 of week 1 of month 1   
- 02-Jan is day 6 of week 1 of month 1   
- 03-Jan is day 7 of week 1 of month 1   
- 04-Jan is day 1 of week 2 of month 1   
- 05-Jan is day 2 of week 2 of month 1   
- 06-Jan is day 3 of week 2 of month 1   
- 07-Jan is day 4 of week 2 of month 1   
- 08-Jan is day 5 of week 2 of month 1   
- 09-Jan is day 6 of week 2 of month 1   
- 10-Jan is day 7 of week 2 of month 1   
- 11-Jan is day 1 of week 3 of month 1   
- 12-Jan is day 2 of week 3 of month 1   
- 13-Jan is day 3 of week 3 of month 1   
- 14-Jan is day 4 of week 3 of month 1   
- 15-Jan is day 5 of week 3 of month 1   
- 16-Jan is day 6 of week 3 of month 1   
- 17-Jan is day 7 of week 3 of month 1   
- 18-Jan is day 1 of week 4 of month 1   
- 19-Jan is day 2 of week 4 of month 1   
- 20-Jan is day 3 of week 4 of month 1   
- 21-Jan is day 4 of week 4 of month 1   
- 22-Jan is day 5 of week 4 of month 1   
- 23-Jan is day 6 of week 4 of month 1   
- 24-Jan is day 7 of week 4 of month 1   
- 25-Jan is day 1 of week 5 of month 1   
- 26-Jan is day 2 of week 5 of month 1   
- 27-Jan is day 3 of week 5 of month 1   
- 28-Jan is day 4 of week 5 of month 1   
- 29-Jan is day 5 of week 5 of month 1   
- 30-Jan is day 6 of week 5 of month 1   
- 31-Jan is day 7 of week 5 of month 1   





Build and run on device with it's region set to the Netherlands 
--------

**Sunday Button:**

Start on day 1 (Sunday)  
- 01-jan is day 5 of week 0 of month 1   
- 02-jan is day 6 of week 0 of month 1   
- 03-jan is day 7 of week 0 of month 1   
- 04-jan is day 1 of week 1 of month 1   
- 05-jan is day 2 of week 1 of month 1   
- 06-jan is day 3 of week 1 of month 1   
- 07-jan is day 4 of week 1 of month 1   
- 08-jan is day 5 of week 1 of month 1   
- 09-jan is day 6 of week 1 of month 1   
- 10-jan is day 7 of week 1 of month 1   
- 11-jan is day 1 of week 2 of month 1   
- 12-jan is day 2 of week 2 of month 1   
- 13-jan is day 3 of week 2 of month 1   
- 14-jan is day 4 of week 2 of month 1   
- 15-jan is day 5 of week 2 of month 1   
- 16-jan is day 6 of week 2 of month 1   
- 17-jan is day 7 of week 2 of month 1   
- 18-jan is day 1 of week 3 of month 1   
- 19-jan is day 2 of week 3 of month 1   
- 20-jan is day 3 of week 3 of month 1   
- 21-jan is day 4 of week 3 of month 1   
- 22-jan is day 5 of week 3 of month 1   
- 23-jan is day 6 of week 3 of month 1   
- 24-jan is day 7 of week 3 of month 1   
- 25-jan is day 1 of week 4 of month 1   
- 26-jan is day 2 of week 4 of month 1   
- 27-jan is day 3 of week 4 of month 1   
- 28-jan is day 4 of week 4 of month 1   
- 29-jan is day 5 of week 4 of month 1   
- 30-jan is day 6 of week 4 of month 1   
- 31-jan is day 7 of week 4 of month 1   


**Monday Button:**

Start on day 2 (Monday)  
- 01-jan is day <b>5</b> of week 1 of month 1   
- 02-jan is day <b>6</b> of week 1 of month 1   
- 03-jan is day <b>7</b> of week 1 of month 1   
- 04-jan is day <b>1</b> of week 1 of month 1   
- 05-jan is day <b>2</b> of week 2 of month 1   
- 06-jan is day <b>3</b> of week 2 of month 1   
- 07-jan is day <b>4</b> of week 2 of month 1   
- 08-jan is day <b>5</b> of week 2 of month 1   
- 09-jan is day <b>6</b> of week 2 of month 1   
- 10-jan is day <b>7</b> of week 2 of month 1   
- 11-jan is day <b>1</b> of week 2 of month 1   
- 12-jan is day <b>2</b> of week 3 of month 1   
- 13-jan is day <b>3</b> of week 3 of month 1   
- 14-jan is day <b>4</b> of week 3 of month 1   
- 15-jan is day <b>5</b> of week 3 of month 1   
- 16-jan is day <b>6</b> of week 3 of month 1   
- 17-jan is day <b>7</b> of week 3 of month 1   
- 18-jan is day <b>1</b> of week 3 of month 1   
- 19-jan is day <b>2</b> of week 4 of month 1   
- 20-jan is day <b>3</b> of week 4 of month 1   
- 21-jan is day <b>4</b> of week 4 of month 1   
- 22-jan is day <b>5</b> of week 4 of month 1   
- 23-jan is day <b>6</b> of week 4 of month 1   
- 24-jan is day <b>7</b> of week 4 of month 1   
- 25-jan is day <b>1</b> of week 4 of month 1   
- 26-jan is day <b>2</b> of week 5 of month 1   
- 27-jan is day <b>3</b> of week 5 of month 1   
- 28-jan is day <b>4</b> of week 5 of month 1   
- 29-jan is day <b>5</b> of week 5 of month 1   
- 30-jan is day <b>6</b> of week 5 of month 1   
- 31-jan is day <b>7</b> of week 5 of month 1   

**Default button:**

Start on day 2 (Monday)  
- 01-jan is day <b>5</b> of week 1 of month 1   
- 02-jan is day <b>6</b> of week 1 of month 1   
- 03-jan is day <b>7</b> of week 1 of month 1   
- 04-jan is day <b>1</b> of week 1 of month 1   
- 05-jan is day <b>2</b> of week 2 of month 1   
- 06-jan is day <b>3</b> of week 2 of month 1   
- 07-jan is day <b>4</b> of week 2 of month 1   
- 08-jan is day <b>5</b> of week 2 of month 1   
- 09-jan is day <b>6</b> of week 2 of month 1   
- 10-jan is day <b>7</b> of week 2 of month 1   
- 11-jan is day <b>1</b> of week 2 of month 1   
- 12-jan is day <b>2</b> of week 3 of month 1   
- 13-jan is day <b>3</b> of week 3 of month 1   
- 14-jan is day <b>4</b> of week 3 of month 1   
- 15-jan is day <b>5</b> of week 3 of month 1   
- 16-jan is day <b>6</b> of week 3 of month 1   
- 17-jan is day <b>7</b> of week 3 of month 1   
- 18-jan is day <b>1</b> of week 3 of month 1   
- 19-jan is day <b>2</b> of week 4 of month 1   
- 20-jan is day <b>3</b> of week 4 of month 1   
- 21-jan is day <b>4</b> of week 4 of month 1   
- 22-jan is day <b>5</b> of week 4 of month 1   
- 23-jan is day <b>6</b> of week 4 of month 1   
- 24-jan is day <b>7</b> of week 4 of month 1   
- 25-jan is day <b>1</b> of week 4 of month 1   
- 26-jan is day <b>2</b> of week 5 of month 1   
- 27-jan is day <b>3</b> of week 5 of month 1   
- 28-jan is day <b>4</b> of week 5 of month 1   
- 29-jan is day <b>5</b> of week 5 of month 1   
- 30-jan is day <b style="color: red">6</b> of week 5 of month 1   
- 31-jan is day <b>7</b> of week 5 of month 1   


