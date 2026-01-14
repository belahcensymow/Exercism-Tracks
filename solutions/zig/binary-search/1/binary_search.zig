const std = @import("std");
pub fn binarySearch(typeof: type, target: usize, items: anytype) ?usize {
    var result: usize = 0;
    if (items.len == 0) return null;
    if (items.len == 1) {
        if (@as(typeof, items[0]) == target) return result else return null;
    }
    const m: usize = items.len / 2;
    if (target >= @as(typeof, items[m])) {
        const rightHalf = items[m..];
        const n: ?usize = binarySearch(typeof, target, rightHalf);
        result += m;
        result += n orelse return null;
    } else {
        const leftHalf = items[0..m];
        const n: ?usize = binarySearch(typeof, target, leftHalf);
        result += n orelse return null;
    }
    return result;
}
