pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) anyerror!usize {
    if (number == 0) return ComputationError.IllegalArgument;
    var stepsNumber: usize = 0;
    var n = number;
    while (n > 1) : (stepsNumber += 1) {
        if ((n % 2) == 0) n /= 2 else n = (n * 3) + 1;
    }
    return stepsNumber;
}
