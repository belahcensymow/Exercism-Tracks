const std = @import("std");

pub fn recite(buffer: []u8, start_bottles: u32, take_down: u32) []const u8 {
    var n: u32 = take_down;
    var position: usize = 0;
    while (n > 0) : (n -= 1) {
        for (0..2) |_| {
            for (switch (start_bottles - take_down + n) {
                1 => "One green bottle hanging on the wall,\n",
                2 => "Two green bottles hanging on the wall,\n",
                3 => "Three green bottles hanging on the wall,\n",
                4 => "Four green bottles hanging on the wall,\n",
                5 => "Five green bottles hanging on the wall,\n",
                6 => "Six green bottles hanging on the wall,\n",
                7 => "Seven green bottles hanging on the wall,\n",
                8 => "Eight green bottles hanging on the wall,\n",
                9 => "Nine green bottles hanging on the wall,\n",
                10 => "Ten green bottles hanging on the wall,\n",
                else => "",
            }) |letter| {
                buffer[position] = letter;
                position += 1;
            }
        }
        for ("And if one green bottle should accidentally fall,\nThere'll be ") |letter| {
            buffer[position] = letter;
            position += 1;
        }
        for (switch (start_bottles - take_down + n - 1) {
            0 => "no green bottles hanging on the wall.\n\n",
            1 => "one green bottle hanging on the wall.\n\n",
            2 => "two green bottles hanging on the wall.\n\n",
            3 => "three green bottles hanging on the wall.\n\n",
            4 => "four green bottles hanging on the wall.\n\n",
            5 => "five green bottles hanging on the wall.\n\n",
            6 => "six green bottles hanging on the wall.\n\n",
            7 => "seven green bottles hanging on the wall.\n\n",
            8 => "eight green bottles hanging on the wall.\n\n",
            9 => "nine green bottles hanging on the wall.\n\n",
            10 => "ten green bottles hanging on the wall.\n\n",
            else => "",
        }) |letter| {
            buffer[position] = letter;
            position += 1;
        }
    }
    return buffer[0 .. position - 2];
}
