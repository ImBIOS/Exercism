const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    // var letters = std.ComptimeBitSet(26).init(false);
    var letters = std.bit_set.IntegerBitSet(26).initEmpty();

    // Mark all letters
    for (str) |byte| {
        const lowerByte = std.ascii.toLower(byte);
        if (lowerByte >= 'a' and lowerByte <= 'z') {
            letters.set(lowerByte - 'a');
        }
    }

    // Check if all letters were marked
    const allLetters = std.bit_set.IntegerBitSet(26).initFull();
    return letters.eql(allLetters);
}
