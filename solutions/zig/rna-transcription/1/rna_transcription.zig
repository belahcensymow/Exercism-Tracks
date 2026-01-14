const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    const len = dna.len;
    var rna = try allocator.alloc(u8, len);
    for (0..len) |i| rna[i] = switch (dna[i]) {
        'G' => 'C',
        'C' => 'G',
        'T' => 'A',
        'A' => 'U',
        else => unreachable,
    };
    return rna;
}
