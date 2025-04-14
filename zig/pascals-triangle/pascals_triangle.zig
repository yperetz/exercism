const std = @import("std");
const mem = std.mem;

pub fn rows(allocator: mem.Allocator, count: usize) mem.Allocator.Error![][]u128 {
    var ans = try allocator.alloc([]u128, count);
    errdefer allocator.free(ans);
    if (count == 0)
        return ans;
    ans[0] = try allocator.alloc(u128, 1);
    ans[0][0] = 1;
    for (1..count) |i| {
        ans[i] = allocator.alloc(u128, i + 1) catch |err| {
            for (0..i) |idx| {
                allocator.free(ans[i - 1 - idx]); // reverse order
            }

            return err;
        };

        for (0..i + 1) |j| {
            const leftparent = if (j == 0) 0 else ans[i - 1][j - 1];
            const rightparent = if (j == i) 0 else ans[i - 1][j];
            ans[i][j] = leftparent + rightparent;
        }
    }

    return ans;
}
