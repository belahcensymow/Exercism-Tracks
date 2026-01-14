const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var wordlist = mem.splitAny(u8, words, " -_");
    var length: usize = 0;
    while (wordlist.next()) |word| {
        if (word.len > 0) length += 1;
    }
    wordlist.reset();
    const result = try allocator.alloc(u8, length);
    var counter: usize = 0;
    while (wordlist.next()) |word| {
        if (word.len > 0) {
            result[counter] = std.ascii.toUpper(word[0]);
            counter += 1;
        }
    }
    return result;
}
