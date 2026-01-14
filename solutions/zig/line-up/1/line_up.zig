const std = @import("std");
const mem = std.mem;

pub fn format(allocator: mem.Allocator, name: []const u8, number: u10) ![]u8 {
    var buffer: std.ArrayListUnmanaged(u8) = .empty;
    errdefer buffer.deinit(allocator);
    if (number % 10 == 1 and number % 100 != 11)
        try buffer.writer(allocator).print("{s}, you are the {}st customer we serve today. Thank you!", .{ name, number })
    else if (number % 10 == 2 and number % 100 != 12)
        try buffer.writer(allocator).print("{s}, you are the {}nd customer we serve today. Thank you!", .{ name, number })
    else if (number % 10 == 3 and number % 100 != 13)
        try buffer.writer(allocator).print("{s}, you are the {}rd customer we serve today. Thank you!", .{ name, number })
    else
        try buffer.writer(allocator).print("{s}, you are the {}th customer we serve today. Thank you!", .{ name, number });
    return buffer.toOwnedSlice(allocator);
}
