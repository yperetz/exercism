pub fn eggCount(number: usize) usize {
    // using Brian Kernighan's algorithm
    var n = number;
    var count: u8 = 0;

    while (n != 0) {
        n &= n - 1;
        count += 1;
    }

    return count;
}
