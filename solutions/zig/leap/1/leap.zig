pub fn isLeapYear(year: u32) bool {
    if (year % 100 == 0) if (year % 400 == 0) return true else return false;
    if (year % 4 == 0) return true else return false;
}