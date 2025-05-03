const std = @import("std");
const mem = std.mem;

pub fn rotate(allocator: mem.Allocator, text: []const u8, shiftKey: u5) mem.Allocator.Error![]u8 {
    const MASK: u8 = 0b1100000;
    const CYCLE: u8 = 26;
    var ans = try allocator.alloc(u8, text.len);
    errdefer allocator.free(ans);

    for (0..text.len) |i| {
        if (!std.ascii.isAlphabetic(text[i])) {
            ans[i] = text[i];
            continue;
        }

        const caseBase = text[i] & MASK + 1;
        ans[i] = (text[i] - caseBase + shiftKey) % CYCLE + caseBase;
    }

    return ans;
}
