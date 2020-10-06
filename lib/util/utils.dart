import 'package:intl/intl.dart';

class Val {
// Validations
    static String ValidateTitle(String val) {
        return (val != null && val != "") ? null : "Title cannot be empty";
    }
    static String GetExpiryStr(String expires) {
        var e = DateUtils.convertToDate(expires);
        var td = new DateTime.now();
        Duration dif = e.difference(td);
        int dd = dif.inDays + 1;
        return (dd > 0) ? dd.toString() : "0";
    }

    static bool StrToBool(String str) {
        return (int.parse(str) > 0) ? true : false;
    }
    //parse string to integer and check if it is 0(false) or greater(true)
    static bool IntToBool(int val) {
        return (val > 0) ? true : false;
    }

    static String BoolToStr(bool val) {
        return (val == true) ? "1" : "0";
    }

    static int BoolToInt(bool val) {
        return (val == true) ? 1 : 0;
    }
}

class DateUtils {
    static DateTime convertToDate(String input) {
        try
        {
            var d = new DateFormat("yyyy-MM-dd").parseStrict(input);
            return d;
        } catch (e) {
            return null;
        }
    }
    //use a set formatter to fully convert a string(date) to d-m-y from converttodate's y-m-d 
    static String convertToDateFull(String input) {
        try
        {
            var d = new DateFormat("yyyy-MM-dd").parseStrict(input);
            var formatter = new DateFormat('dd MMM yyyy');
            return formatter.format(d);
        } catch (e) {
            return null;
        }
    }
 
   //converts a datetime element to format d M y
    static String convertToDateFullDt(DateTime input) {
        try
        {
            var formatter = new DateFormat('dd MMM yyyy');
            return formatter.format(input);
        } catch (e) {
            return null;
        }
    }
//uses the true/false to check if a string is of the "yyyy-MM-dd" format when strictly parsed
//if it was intended as a date, parsestrict would be able to fix it from any format to above
    static bool isDate(String dt) {
        try
        {
            var d = new DateFormat("yyyy-MM-dd").parseStrict(dt);
            return true;
        } catch (e) {
            return false;
        }
    }

    static bool isValidDate(String dt) {
        if (dt.isEmpty || !dt.contains("-") || dt.length < 10) return false;
        List<String> dtItems = dt.split("-");
        //parse the (-)split string to integers and make a Datetime element out of the 3 ints
        var d = DateTime(int.parse(dtItems[0]),
        int.parse(dtItems[1]), int.parse(dtItems[2]));
        //return if the resultant Datetime has isdate(y-M-d) after format and 
        //comes after the current datetime
        return d != null && isDate(dt) &&
        d.isAfter(new DateTime.now());
    }

// String functions
    static String daysAheadAsStr(int daysAhead) {
        var now = new DateTime.now();
        add the daysAhead int as a days duration element to the current date
    // and you get the Date object it becomes when you add the daysAhead. so return all date contents
    //as strings via ftDateAsStr
        DateTime ft = now.add(new Duration(days: daysAhead));
        return ftDateAsStr(ft);
    }
// format the string from datetime to be year - month
    static String ftDateAsStr(DateTime ft) {
        return ft.year.toString() + "-" +
        ft.month.toString().padLeft(2, "0") + "-" +
        ft.day.toString().padLeft(2, "0");
    }

//trims whitespace from the input dt, to get a string list and returns the first object of the resultant list
    static String TrimDate(String dt) {
        if (dt.contains(" ")) {
        List<String> p = dt.split(" ");
        return p[0];
        }
        else
        return dt;
    }
}