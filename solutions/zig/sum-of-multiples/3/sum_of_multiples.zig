const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    if (limit != 0) {
        var list = std.AutoHashMap(u32, void).init(allocator);
        defer list.deinit();
        for (factors) |factor| {
            if (factor != 0) {
                const max: u32 = if (limit % factor == 0) @divTrunc(limit, factor) - 1 else @divTrunc(limit, factor);
                var i: u32 = 1;
                while (i <= max) : (i += 1) {
                    try list.put(factor * i, {});
                }
            }
        }
        var result: u64 = 0;
        var iter = list.keyIterator();
        while (iter.next()) |n| result += n.*;
        return result;
    } else return 0;
}
