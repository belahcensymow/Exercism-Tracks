const std = @import("std");
const ascii = @import("std").ascii;
pub fn response(s: []const u8) []const u8 {
    var isQuestion: bool = false;
    var isYelling: bool = true;
    var letterCount: usize = 0;
    var charCount: usize = 0;
    const len: usize = s.len;
    for (s) |char| {
        if (ascii.isAlphanumeric(char) or char == '?') charCount += 1;
        if (ascii.isAlphabetic(char)) {
            letterCount += 1;
            if (ascii.isLower(char)) isYelling = false;
        }
    }
    if (charCount == 0) return "Fine. Be that way!";
    for (0..len) |i| {
        if (ascii.isWhitespace(s[len - i - 1])) continue else {
            if (s[len - i - 1] == '?') isQuestion = true;
            break;
        }
    }
    if (letterCount == 0) isYelling = false;
    if (isYelling and isQuestion) return "Calm down, I know what I'm doing!";
    if (isQuestion) return "Sure.";
    if (isYelling) return "Whoa, chill out!";
    return "Whatever.";
}
