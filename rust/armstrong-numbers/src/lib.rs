/// Determine whether a number is an Armstrong number.
/// An Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.
///
/// # Arguments
/// * `num` - The number to be checked
///
/// # Returns
/// * `true` if the number is an Armstrong number
/// * `false` otherwise
///
/// # Examples
/// ```rust
/// use armstrong_numbers::is_armstrong_number;
///
/// assert!(is_armstrong_number(9));
/// assert!(!is_armstrong_number(10));
/// assert!(is_armstrong_number(153));
/// assert!(!is_armstrong_number(154));
/// assert!(is_armstrong_number(9474));
/// ```
pub fn is_armstrong_number(num: u32) -> bool {
    let mut digits = Vec::new();
    let mut n = num;
    while n > 0 {
        digits.push(n % 10);
        n /= 10;
    }
    let len = digits.len() as u32;
    let armstrong_sum: u64 = digits
        .iter()
        .map(|&d| d as u64)
        .map(|d| d.checked_pow(len).unwrap_or(0))
        .sum();

    armstrong_sum == num as u64
}
