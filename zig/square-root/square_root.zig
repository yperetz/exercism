pub fn squareRoot(radicand: usize) usize { //bit-by-bit
    if (radicand <= 1)
        return radicand;

    const lo = squareRoot(radicand >> 2) << 1;
    const hi = lo + 1;
    return if (hi * hi > radicand) lo else hi;
}
