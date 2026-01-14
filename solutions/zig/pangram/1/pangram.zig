const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var letterCounter = [_]bool{false} ** 26;
    const phrase = str;
    for (phrase) |letter| {
        if (std.ascii.isAlphabetic(letter)) {
            const n = std.ascii.toLower(letter) - 'a';
            letterCounter[n] = true;
        }
    }
    for (letterCounter) |value| switch (value) {
        false => return false,
        else => {},
    };
    return true;
}
