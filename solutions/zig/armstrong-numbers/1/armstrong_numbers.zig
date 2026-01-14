const std = @import("std");
pub fn isArmstrongNumber(num: u128) bool {
    var len: u128 = 0;
    var number = num;
    while (number > 0) {
        number = (number - (number % 10)) / 10;
        len += 1;
    }
    return (num == calculate(num, len));
}

pub fn calculate(num: u128, pow: u128) u128 {
    if (num == 0) return 0;
    var result = std.math.pow(u128, num % 10, pow);
    const number = (num - num % 10) / 10;
    if (number > 0) {
        result += calculate(number, pow);
    }
    return result;
}
