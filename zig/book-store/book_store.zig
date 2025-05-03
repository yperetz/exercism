const std = @import("std");

pub fn total(basket: []const u32) u32 {
    var hist: [5]u32 = .{0} ** 5;
    for (basket) |book| {
        hist[book - 1] += 1;
    }

    const bundlePrice = comptime [_]u32{ 800, 2 * 760, 3 * 720, 4 * 640, 5 * 600 };

    std.mem.sort(u32, &hist, {}, std.sort.asc(u32));
    var bundles = [_]u32{
        hist[4] - hist[3],
        hist[3] - hist[2],
        hist[2] - hist[1],
        hist[1] - hist[0],
        hist[0],
    };

    // optimize for groups of 4 instead of 3s and 5s
    const potential4s = @min(bundles[2], bundles[4]);
    bundles[2] -= potential4s;
    bundles[4] -= potential4s;
    bundles[3] += potential4s * 2;

    var sum: u32 = 0;
    for (bundles, 0..) |count, i| {
        sum += count * bundlePrice[i];
    }

    return sum;
}
