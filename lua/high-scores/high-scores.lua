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

    function HighScores:personal_top_three()
        local top_three = {}
        local scores_copy = {table.unpack(self.scores_list)} -- Create a copy of the scores list
        local scores_count = #scores_copy
        local top_three_count = 3

        if scores_count < top_three_count then
            top_three_count = scores_count
        end

        for i = 1, top_three_count do
            local best = 0
            local best_index = 0
            for j = 1, #scores_copy do
                if scores_copy[j] > best then
                    best = scores_copy[j]
                    best_index = j
                end
            end
            table.insert(top_three, best)
            table.remove(scores_copy, best_index)
        end

        return top_three
    end

    return HighScores
end
