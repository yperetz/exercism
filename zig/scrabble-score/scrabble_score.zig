pub fn score(s: []const u8) u32 {
    const lut = [_]u8{ 1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10 };

    const MASK: u8 = 0b1100000;
    var sum: u16 = 0;
    for (s) |letter| {
        const caseBase = (letter & MASK) + 1;
        const valIdx = letter - caseBase;
        sum += lut[valIdx];
    }

    return sum;
}
