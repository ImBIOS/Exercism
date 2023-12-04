local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
  local digits = {}
  local sum = 0
  local n = number
  while n > 0 do
    table.insert(digits, n % 10)
    n = math.floor(n / 10)
  end
  for _, digit in ipairs(digits) do
    sum = sum + digit ^ #digits
  end
  return sum == number
end

return ArmstrongNumbers
