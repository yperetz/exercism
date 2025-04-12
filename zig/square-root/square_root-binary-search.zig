pub fn squareRoot(radicand: usize) usize { //binary search
    const pivot = 0.25;
    var root: usize = 0;
    var square: usize = 0;
    var lo: usize = 0;
    var hi: usize = radicand;
    var diff: usize = hi - lo;

    while (diff > 0) {
        if (square == radicand)
            return root;

        if (square > radicand) {
            hi = root - 1;
        } else {
            lo = root + 1;
        }

        diff = hi - lo;
        const scaled: usize = @intFromFloat(pivot * @as(f64, @floatFromInt(diff)));
        root = scaled + lo;
        square = root * root;
    }

    return root;
}
