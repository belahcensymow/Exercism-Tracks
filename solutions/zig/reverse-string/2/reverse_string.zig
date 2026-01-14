const std = @import("std");
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    const len = buffer.len;
    for (1..len) |i| buffer[i] = s[len - i - 1];
    return buffer;
}
