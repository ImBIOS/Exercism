const std = @import("std");

pub fn isArmstrongNumber(n: u128) bool {
    const digit_count = countDigits(n);
    var sum: u128 = 0;
    var temp: u128 = n;

    while (temp > 0) {
        const digit: u128 = temp % 10;
        sum += std.math.pow(u128, digit, digit_count);
        temp /= 10;
    }

    return sum == n;
}

fn countDigits(n: u128) u8 {
    var count: u8 = 0;
    var temp: u128 = n;
    while (temp != 0) {
        count += 1;
        temp /= 10;
    }
    return count;
}
