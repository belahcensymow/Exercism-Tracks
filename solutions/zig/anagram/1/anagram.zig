const std = @import("std");
const mem = std.mem;

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var set = std.BufSet.init(allocator);
    errdefer set.deinit();

    for (candidates) |candidate| {
        var isEqual: bool = true;
        var tester = std.ArrayList(u8).init(allocator);
        defer tester.deinit();
        if (candidate.len != word.len) continue;
        for (candidate, word) |n, m| {
            if (std.ascii.toLower(n) != std.ascii.toLower(m)) {
                isEqual = false;
                break;
            }
        }
        for (candidate) |letter| try tester.append(std.ascii.toLower(letter));
        if (isEqual) continue;
        for (word) |letter| {
            var n: u8 = 0;
            for (tester.items, 0..) |item, i| {
                if (std.ascii.toLower(item) == std.ascii.toLower(letter)) {
                    _ = tester.orderedRemove(i - n);
                    n += 1;
                    break;
                }
            }
        }
        if (tester.items.len == 0) try set.insert(candidate);
    }
    return set;
}
