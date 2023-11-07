const std = @import("std");

pub fn isValidIsbn10(str: []const u8) bool {
    // Early return if string is obviously too long
    if (str.len > 13) return false;

    var isbn: [10]u8 = undefined;
    var isbn_index: usize = 0;

    // Sanitize the ISBN (remove hyphens and check length)
    for (str) |ch| {
        if (ch != '-') {
            if (isbn_index >= isbn.len) return false; // Too long
            isbn[isbn_index] = ch;
            isbn_index += 1;
        }
    }
    if (isbn_index != isbn.len) return false; // Too short

    var sum: u16 = 0;
    for (isbn, 0..) |ch, i| {
        var value: u8 = if (ch == 'X' and i == 9) 10 else std.fmt.parseInt(u8, &[1]u8{ch}, 10) catch {
            // Invalid character
            return false;
        };
        if (value > 10) return false; // Invalid character
        sum += @as(u16, @intCast(value)) * (@as(u16, @intCast(10)) - @as(u16, @intCast(i)));
    }

    return sum % 11 == 0;
}
