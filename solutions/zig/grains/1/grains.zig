const pow = @import("std").math.pow;
pub const ChessboardError = error{IndexOutOfBounds};
pub fn square(index: usize) ChessboardError!u64 {
    if (index > 64 or index == 0) return ChessboardError.IndexOutOfBounds;
    var result: u64 = 1;
    for (0..index - 1) |_| {
        result *= 2;
    }
    return result;
}

pub fn total() u64 {
    var result: u64 = 0;
    for (0..65) |value| {
        result += square(value) catch 0;
    }
    return result;
}
