return function(values)
  local HighScores = {}

  -- Directly assign the passed values to scores_list
  HighScores.scores_list = values[1]

  function HighScores:scores()
    return self.scores_list
  end

  function HighScores:latest()
    return self.scores_list[#self.scores_list]
  end

  function HighScores:personal_best()
    local best = 0
    for _, score in ipairs(self.scores_list) do
      if score > best then
        best = score
      end
    end
    return best
  end

  return HighScores
end
