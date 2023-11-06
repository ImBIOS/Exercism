const std = @import("std");

pub fn score(s: []const u8) u32 {
    var scored: u32 = 0;
    for (s) |letter| {
        const c = std.ascii.toLower(letter);
        scored = switch (c) {
            'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' => scored + 1,
            'd', 'g' => scored + 2,
            'b', 'c', 'm', 'p' => scored + 3,
            'f', 'h', 'v', 'w', 'y' => scored + 4,
            'k' => scored + 5,
            'j', 'x' => scored + 8,
            'q', 'z' => scored + 10,
            else => scored,
        };
    }
    return scored;
}
