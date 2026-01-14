const std = @import("std");
pub fn truncate(phrase: []const u8) []const u8 {
    var iterator = std.unicode.Utf8View.iterator(.{ .bytes = phrase });
    return iterator.peek(5);
}
