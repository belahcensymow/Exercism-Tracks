const std = @import("std");
pub fn truncate(phrase: []const u8) []const u8 {
    const view = std.unicode.Utf8View.init(phrase) catch return "";
    var iterator = view.iterator();
    var count: usize = 0;
    while (count < 5) : (count += 1) _ = iterator.nextCodepoint() orelse break;
    return phrase[0..iterator.i];
}
