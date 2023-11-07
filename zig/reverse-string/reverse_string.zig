/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    const len = s.len;
    var i: usize = 0;
    while (i < len) : (i += 1) {
        buffer[len - i - 1] = s[i];
    }
    return buffer;
}
