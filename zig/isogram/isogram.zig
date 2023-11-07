pub fn isIsogram(str: []const u8) bool {
    var seen: [26]bool = undefined;
    for (str) |c| {
        if (c >= 'a' and c <= 'z') {
            const i = (c - 'a');
            if (seen[i]) {
                return false;
            }
            seen[i] = true;
        } else if (c >= 'A' and c <= 'Z') {
            const i = (c - 'A');
            if (seen[i]) {
                return false;
            }
            seen[i] = true;
        }
    }
    return true;
}
