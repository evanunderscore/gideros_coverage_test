function _require(name)
	-- suppress Strict; use for loading third-party code
	local strict, strong = Strict.strict, Strict.strong
	Strict.strict, Strict.strong = false, false
	local module = require(name)
	Strict.strict, Strict.strong = strict, strong
	return module
end

require('luastrict.Strict')
Strict.strong = true
