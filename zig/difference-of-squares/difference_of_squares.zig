pub fn squareOfSum(number: usize) usize {
    const sum: usize = number * (number + 1) / 2;

    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    var sum: usize = 0;
    for (1..(number + 1)) |i| {
        sum += i * i;
    }

    return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
