pub fn squareRoot(radicand: usize) usize {
    var x: usize = radicand;
    var c: usize = 0;
    var d: usize = 1 << 30;
    while (d > x) {
        d >>= 2;
    }
    while (d != 0) {
        if (x >= c + d) {
            x -= c + d;
            c = (c >> 1) + d;
        } else {
            c >>= 1;
        }
        d >>= 2;
    }
    return c;
}
