return function(values)
  local HighScores = {}

  -- Directly assign the passed values to scores_list
  HighScores.scores_list = values[1]

  function HighScores:scores()
    return self.scores_list
  end

  return HighScores
end
