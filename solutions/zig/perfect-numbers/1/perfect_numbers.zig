pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    var value: u64 = 0;
    for (1..@intCast(n)) |i| {
        if (n % i == 0) value += i;
    }
    if (value == n) return Classification.perfect;
    if (value < n) return Classification.deficient;
    return Classification.abundant;
}
