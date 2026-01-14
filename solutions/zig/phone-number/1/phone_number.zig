const ascii = @import("std").ascii;
pub fn clean(phrase: []const u8) ?[10]u8 {
    var formated: [11]u8 = undefined;
    var result: [10]u8 = undefined;
    var count: u8 = 0;
    for (phrase) |c| {
        if (count == 11) return null;
        if (ascii.isDigit(c)) {
            formated[count] = c;
            count += 1;
        }
    }
    switch (count) {
        11 => if (formated[0] != '1') return null else {
            for (1..11) |n| result[n - 1] = formated[n];
        },
        10 => {
            for (0..10) |n| result[n] = formated[n];
        },
        else => return null,
    }
    if (result[0] < '2' or result[3] < '2') return null;
    return result;
}
