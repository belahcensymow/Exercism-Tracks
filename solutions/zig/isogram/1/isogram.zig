const std = @import("std");
pub fn isIsogram(str: []const u8) bool {
    const letters = str;
    var foundLetters: [26]bool = .{false} ** 26;
    for (letters) |letter| {
        if (std.ascii.isAlphabetic(letter)) {
            const n = std.ascii.toLower(letter) - 'a';
            if (foundLetters[n] == true) return false
        else foundLetters[n] = true;
        }
    }
    return true;
}
