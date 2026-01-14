const pow = @import("std").math.pow;
pub const ColorBand = enum { black, brown, red, orange, yellow, green, blue, violet, grey, white };

pub fn colorCode(colors: [2]ColorBand) usize {
    var result: usize = 0;
    for (0..2) |i| result += switch (colors[i]) {
        .black => 0 * pow(usize, 10, 1 - i),
        .brown => 1 * pow(usize, 10, 1 - i),
        .red => 2 * pow(usize, 10, 1 - i),
        .orange => 3 * pow(usize, 10, 1 - i),
        .yellow => 4 * pow(usize, 10, 1 - i),
        .green => 5 * pow(usize, 10, 1 - i),
        .blue => 6 * pow(usize, 10, 1 - i),
        .violet => 7 * pow(usize, 10, 1 - i),
        .grey => 8 * pow(usize, 10, 1 - i),
        .white => 9 * pow(usize, 10, 1 - i),
    };
    return result;
}
