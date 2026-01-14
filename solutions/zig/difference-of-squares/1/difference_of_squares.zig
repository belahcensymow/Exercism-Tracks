const pow = @import("std").math.pow;
pub fn squareOfSum(number: usize) usize {
    var result: usize = 0;
    for (0..number + 1) |value| {
        result += value;
    }
    return pow(usize, result, 2);
}

pub fn sumOfSquares(number: usize) usize {
    var result: usize = 0;
    for (0..number + 1) |value| {
        result += pow(usize, value, 2);
    }
    return result;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
