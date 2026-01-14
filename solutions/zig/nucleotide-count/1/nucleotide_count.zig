const std = @import("std");
pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32 = 0,
    c: u32 = 0,
    g: u32 = 0,
    t: u32 = 0,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var counts = Counts{};
    for (s) |letter| switch (std.ascii.toLower(letter)) {
        'a' => counts.a += 1,
        'c' => counts.c += 1,
        'g' => counts.g += 1,
        't' => counts.t += 1,
        else => return NucleotideError.Invalid,
    };
    return counts;
}
