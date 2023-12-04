local PopCount = {}

function PopCount.egg_count(number)
  local count = 0
  while number > 0 do
    if number % 2 == 1 then
      count = count + 1
    end
    number = math.floor(number / 2)
  end
  return count
end

return PopCount
