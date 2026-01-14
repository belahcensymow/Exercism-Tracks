pub fn eggCount(number: usize) usize {
    if (number == 0) return 0;
    var actualCount: usize = 0;
    var n = number;
    while (n >= 1) {
        if ((n % 2) == 0) n = (n / 2) else {
            n = ((n - 1) / 2);
            actualCount += 1;
        }
    }
    return actualCount;
}
