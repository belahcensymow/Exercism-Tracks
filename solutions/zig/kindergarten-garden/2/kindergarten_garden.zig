const std = @import("std");
pub const Plant = enum {
    clover,
    grass,
    radishes,
    violets,
};

pub fn plant(char: u8) Plant {
    return switch (char) {
        'C' => .clover,
        'G' => .grass,
        'R' => .radishes,
        'V' => .violets,
        else => unreachable,
    };
}

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    const len: u8 = @intCast(diagram.len / 2);
    const n: u8 = (student[0] - 'A') * 2;
    const result: [4]Plant = .{
        plant(diagram[n]),
        plant(diagram[n + 1]),
        plant(diagram[n + len + 1]),
        plant(diagram[n + len + 2]),
    };

    return result;
}
