pub const Plant = enum {
    clover,
    grass,
    radishes,
    violets,
};

fn plantFromLetter(letter: usize) Plant {
    switch (letter) {
        'C' => return .clover,
        'G' => return .grass,
        'R' => return .radishes,
        else => return .violets,
    }
}

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    const studentIdx = student[0] - 'A';
    var ans: [4]Plant = undefined;
    for (0..2) |i| {
        const rowStart = i * ((diagram.len - 1) / 2 + 1);
        ans[i * 2] = plantFromLetter(diagram[studentIdx * 2 + rowStart]);
        ans[i * 2 + 1] = plantFromLetter(diagram[studentIdx * 2 + 1 + rowStart]);
    }

    return ans;
}
