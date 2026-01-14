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
        else => .grass,
    };
}

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    const len: u8 = @intCast(diagram.len / 2);
    const n: u8 = switch (student[0]) {
        'A' => 0,
        'B' => 2,
        'C' => 4,
        'D' => 6,
        'E' => 8,
        'F' => 10,
        'G' => 12,
        'H' => 14,
        'I' => 16,
        'J' => 18,
        'K' => 20,
        'L' => 22,
        else => 0,
    };
    const result: [4]Plant = .{
        plant(diagram[n]),
        plant(diagram[n + 1]),
        plant(diagram[n + len + 1]),
        plant(diagram[n + len + 2]),
    };

    return result;
}
