const std = @import("std");
const mem = std.mem;

pub const ColorBand = enum(u8) {
    black = 0,
    brown = 1,
    red = 2,
    orange = 3,
    yellow = 4,
    green = 5,
    blue = 6,
    violet = 7,
    grey = 8,
    white = 9,
};
pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {
    std.debug.print("Colors: {?s},{?s},{?s}\n", .{ std.enums.tagName(ColorBand, colors[0]), std.enums.tagName(ColorBand, colors[1]), std.enums.tagName(ColorBand, colors[2]) });
    var result: std.ArrayListUnmanaged(u8) = .empty;
    errdefer result.deinit(allocator);
    const a: u8 = @intFromEnum(colors[0]);
    const b: u8 = @intFromEnum(colors[1]);
    const c: u8 = @intFromEnum(colors[2]);
    const ohm = (b + (a * 10)) * std.math.pow(u64, 10, c);
    if (ohm >= 1_000_000_000)
        try result.writer(allocator).print("{} gigaohms", .{@as(f64, @floatFromInt(ohm)) / 1_000_000_000})
    else if (ohm >= 1_000_000)
        try result.writer(allocator).print("{} megaohms", .{@as(f64, @floatFromInt(ohm)) / 1_000_000})
    else if (ohm >= 1000)
        try result.writer(allocator).print("{} kiloohms", .{@as(f64, @floatFromInt(ohm)) / 1000})
    else
        try result.writer(allocator).print("{} ohms", .{ohm});
    std.debug.print("{s}\n", .{result.items});
    return result.toOwnedSlice(allocator);
}
