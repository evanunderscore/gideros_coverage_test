local luaunit = _require('luaunit')
local maths = require('scripts.maths')

Strict.declareGlobal('TestMaths', {})
	function TestMaths:testAdder()
		luaunit.assertEquals(maths.adder(1, 2), 3)
	end

	function TestMaths:testSubber()
		luaunit.assertEquals(maths.subber(1, 2), -1)
	end
-- TestMaths

os.exit(luaunit.LuaUnit.run())
