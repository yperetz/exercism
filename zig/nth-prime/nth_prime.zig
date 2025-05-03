const std = @import("std");
const mem = std.mem;

pub fn prime(allocator: mem.Allocator, number: usize) !usize {
    var primes = std.ArrayList(usize).init(allocator);
    defer primes.deinit();
    try primes.append(2);
    try primes.append(3);

    var currentNum: usize = primes.items[primes.items.len - 1];
    while (primes.items.len < number) {
        currentNum += 2;
        var isPrime = true;
        for (primes.items) |value| {
            if (currentNum % value == 0) {
                isPrime = false;
                break;
            }
        }

        if (isPrime) {
            try primes.append(currentNum);
        }
    }

    return primes.items[number - 1];
}
