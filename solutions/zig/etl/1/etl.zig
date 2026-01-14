const std = @import("std");

pub fn transform(allocator: std.mem.Allocator, legacy: std.AutoHashMap(i5, []const u8)) std.mem.Allocator.Error!std.AutoHashMap(u8, i5) {
    var result = std.AutoHashMap(u8, i5).init(allocator);
    errdefer result.deinit();
    var iterator = legacy.iterator();
    while (iterator.next()) |entry|
        for (entry.value_ptr.*) |letter|
            try result.put(std.ascii.toLower(letter), entry.key_ptr.*);
    return result;
}
