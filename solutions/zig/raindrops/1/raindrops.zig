const std = @import("std");

pub fn convert(buffer: []u8, comptime n: u32) []const u8 {
    const Pling = switch (n % 3) {
        0 => "Pling",
        else => "",
    };
    const Plang = switch (n % 5) {
        0 => "Plang",
        else => "",
    };
    const Plong = switch (n % 7) {
        0 => "Plong",
        else => "",
    };

    const actual = switch ((n % 3 == 0) or (n % 5 == 0) or (n % 7 == 0)) {
        true => Pling ++ Plang ++ Plong,
        false => std.fmt.bufPrint(buffer, "{d}", .{n}) catch unreachable,
    };
    return actual;
}
