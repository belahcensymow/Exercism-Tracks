const std = @import("std");
pub fn truncate(phrase: []const u8) []const u8 {
    const view = std.unicode.Utf8View.init(phrase) catch return "";
    var iterator = view.iterator();
    return iterator.peek(5);
}
