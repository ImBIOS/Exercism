// compute the sum of i from 0 to n then square it
pub fn squareOfSum(number: usize) usize {
    const sum = number * (number + 1) / 2;
    return sum * sum;
}

// compute the sum of i^2 from 0 to n
pub fn sumOfSquares(number: usize) usize {
    const sum = number * (number + 1) * (2 * number + 1) / 6;
    return sum;
}

// compute the difference between the square of sum and sum of squares
pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
