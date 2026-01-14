const std = @import("std");
const mem = std.mem;

pub fn inList(T: type, haystack: []const T, needle: T) bool {
    for (haystack) |element| {
        if (element == needle) return true;
    }
    return false;
}

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    if (limit != 0) {
        const list = try allocator.alloc(u32, limit);
        defer allocator.free(list);
        var indexCounter: usize = 0;
        for (factors) |factor| {
            if (factor != 0) {
                const max: u32 = if (limit % factor == 0) @divTrunc(limit, factor) - 1 else @divTrunc(limit, factor);
                var i: u32 = 1;
                while (i <= max) : (i += 1) {
                    const value: u32 = factor * i;
                    if (inList(u32, list, value) == false) {
                        list[indexCounter] = value;
                        indexCounter += 1;
                    }
                }
            }
        }
        var result: u64 = 0;
        for (0..indexCounter) |n| {
            result += list[n];
        }
        return result;
    } else return 0;
}
