local erroneous_nests = { "align", "align*", "alignat", "alignat*", "multline", "multline*", "gather", "gather*" }

local function list_has_element(list, x)
	for _, v in ipairs(list) do
		if v == x then
			return true
		end
	end
	return false
end

function Math(mth)
	if not quarto.doc.is_format("latex") then
		return
	end

	-- Extract outer environment name if exists
	local nested_env = mth.text:match("^%s*\\begin{([^}]*)}.*\\end{[^}]*}%s*$")
	if not nested_env then
		return
	end

	-- Determine if nested environment will cause error
	local erroneous_nest = list_has_element(erroneous_nests, nested_env)

	if erroneous_nest then
		-- Move content outside of the math environment
		return pandoc.RawInline("tex", mth.text)
	end
end
