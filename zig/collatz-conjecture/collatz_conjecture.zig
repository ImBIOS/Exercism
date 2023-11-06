pub fn steps(number: usize) anyerror!usize {
    if (number == 0) return ComputationError.IllegalArgument;
    var count: usize = 0;
    var num: usize = number;

    while (num > 1) {
        if (num % 2 == 0) {
            num /= 2;
        } else {
            num = 3 * num + 1;
        }
        count += 1;
    }
    return count;
}

pub const ComputationError = error{IllegalArgument};
