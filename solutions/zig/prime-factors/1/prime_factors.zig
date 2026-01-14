const std = @import("std");
const mem = std.mem;

pub fn factors(allocator: mem.Allocator, value: u64) mem.Allocator.Error![]u64 {
    var list = std.ArrayList(u64).init(allocator);
    defer list.deinit();
    if (value < 2) return list.toOwnedSlice();
    var counter: u64 = 2;
    var number: u64 = value;
    while (number >= counter * counter and number > 1) {
        if (number % counter == 0) {
            number /= counter;
            try list.append(counter);
        } else counter += 1;
    }
    if (number > 1) try list.append(number);
    return list.toOwnedSlice();
}
