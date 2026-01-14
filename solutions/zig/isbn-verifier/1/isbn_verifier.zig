const std = @import("std");
const ascii = std.ascii;
pub fn isValidIsbn10(s: []const u8) bool {
    var number: u64 = 0;
    var counter: u64 = 10;
    for (s) |n| {
        if (ascii.isDigit(n)) {
            if (counter == 0) return false;
            number += counter * @as(u16, ascii.toLower(n) - '0');
            counter -= 1;
        } else if (counter == 1 and (ascii.toLower(n) == 'x')) {
            if (counter == 0) return false;
            number += counter * 10;
            counter -= 1;
        } else if (n != '-') return false;
    }
    if (counter != 0) return false;
    return @mod(number, 11) == 0;
}
