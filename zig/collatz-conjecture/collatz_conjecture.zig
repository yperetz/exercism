pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    if (number == 0)
        return ComputationError.IllegalArgument;

    var numSteps: usize = 0;
    var num: usize = number;
    while (num > 1) {
        if (num % 2 == 0) {
            num >>= 1;
        } else {
            num = (num * 3) + 1;
        }

        numSteps += 1;
    }

    return numSteps;
}
